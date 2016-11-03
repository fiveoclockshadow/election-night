require_relative 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def trump
    @_trump ||= Candidate.create(
      name: 'Trump',
      image_url: 'http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg',
      intelligence: 0,
      charisma: 5,
      willpower: 9
    )
  end

  def trump_with_campaigns
    if instance_variable_defined?(:@_trump_with_campaigns)
      @_trump_with_campaigns
    else
      trump.campaigns.create!(start_at: Time.now)
      @_trump_with_campaigns = trump
    end
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

  def test_can_create_a_candidate
    payload = {name: "bob"}
    post "/api/candidates", payload.to_json
    assert_equal 201, last_response.status
    assert_equal "bob", Candidate.last.name
  end

  def parsed_response
    @_parsed_response ||= JSON.parse(last_response.body) if last_response.body
  end
end
