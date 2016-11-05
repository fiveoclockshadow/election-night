require_relative 'test_helper'

class CampaignAppTest < Minitest::Test
  include Rack::Test::Methods
  include Fixtures

  def app
    App
  end

  def setup
    Candidate.delete_all
    Campaign.delete_all
  end

  def test_can_index_campaigns
    trump_with_campaigns
    get '/api/campaigns'
    assert_equal 200, last_response.status
    assert_equal Array, parsed_response.class
    assert parsed_response.first['winning_candidate_id']
  end

  def test_can_get_an_individual_campaign
    trump_with_campaigns
    get "/api/campaigns/#{Campaign.last.id}"
    assert_equal 200, last_response.status
    assert parsed_response['winning_candidate']['name']
  end

  def test_can_create_a_campaign
    gary
    trump
    payload = { candidate_ids: Candidate.pluck(:id) }
    post '/api/campaigns', payload.to_json
    assert_equal 201, last_response.status
    assert_equal [gary, trump], Campaign.last.candidates
  end

  def test_cannot_create_a_campaign_with_invalid_number_of_candidates
    gary
    payload = { candidate_ids: [Candidate.first.id] }
    post '/api/campaigns', payload.to_json
    assert_equal 422, last_response.status
  end

  def parsed_response
    @_parsed_response ||= JSON.parse(last_response.body) if last_response.body
  end
end
