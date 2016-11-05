require_relative 'test_helper'

class CandidateAppTest < Minitest::Test
  include Rack::Test::Methods
  include Fixtures

  def app
    App
  end

  def setup
    Candidate.delete_all
    Campaign.delete_all
  end

  def test_can_index_candidates
    trump
    get '/api/candidates'
    assert_equal 200, last_response.status
    assert_equal Array, parsed_response.class
    assert_equal 'Trump', parsed_response.first['name']
  end

  def test_can_get_an_individual_candidate
    trump_with_campaigns
    get "/api/candidates/#{Candidate.last.id}"
    assert_equal 200, last_response.status
    assert_equal 'Trump', parsed_response['name']
    assert_equal Array, parsed_response['campaigns'].class
  end

  def test_delete_get_an_individual_candidate
    trump_with_campaigns
    delete "/api/candidates/#{Candidate.last.id}"
    assert_equal 200, last_response.status
    assert_equal 'Trump', parsed_response['name']
  end

  def test_can_update_an_individual_candidate
    trump_with_campaigns
    payload = { name: 'jenny' }
    patch "/api/candidates/#{Candidate.last.id}", payload.to_json
    assert_equal 202, last_response.status
    assert_equal 'jenny', parsed_response['name']
  end

  def test_can_create_a_candidate
    payload = { name: 'bob' }
    post '/api/candidates', payload.to_json
    assert_equal 201, last_response.status
    assert_equal 'bob', Candidate.last.name
  end

  def test_cannot_create_a_candidate_with_too_many_skill_points
    payload = { name: 'bob', charisma: 123 }
    post '/api/candidates', payload.to_json
    assert_equal 422, last_response.status
    assert_equal 'must be below 10', parsed_response['errors']['skill_points']
  end

  def test_cannot_create_a_candidate_with_unexpected_attributes_issues_errors
    payload = { name: 'bob', asdf: 'test' }
    post '/api/candidates', payload.to_json
    assert_equal 422, last_response.status
  end
end
