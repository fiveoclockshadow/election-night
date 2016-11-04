require_relative 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def setup
    Candidate.delete_all
    Campaign.delete_all
  end

  def gary
    @_gary ||= Candidate.create(
      name: 'Gary',
      image_url: 'http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg',
      intelligence: 0,
      charisma: 5,
      willpower: 9
    )
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
      gary
      trump
      c = Campaign.new(candidates: Candidate.all, start_at: Time.now)
      c.fight!
      c.save!
      @_trump_with_campaigns = trump
    end
  end

  def test_root_route
    get '/'
    assert_equal(File.read(File.expand_path("../client/public/index.html")), last_response.body)
  end

  def test_can_index_candidates
    trump
    get '/api/candidates'
    assert_equal 200, last_response.status
    assert_equal Array, parsed_response.class
    assert_equal 'Trump', parsed_response.first['name']
  end

  def test_can_index_campaigns
    trump_with_campaigns
    get '/api/campaigns'
    assert_equal 200, last_response.status
    assert_equal Array, parsed_response.class
    assert parsed_response.first["winning_candidate_id"]
  end

  def test_can_get_an_individual_candidate
    trump_with_campaigns
    get "/api/candidates/#{Candidate.last.id}"
    assert_equal 200, last_response.status
    assert_equal 'Trump', parsed_response['name']
    assert_equal Array, parsed_response['campaigns'].class
  end

  def test_can_update_an_individual_candidate
    trump_with_campaigns
    payload = {name: "jenny"}
    patch "/api/candidates/#{Candidate.last.id}", payload.to_json
    assert_equal 202, last_response.status
    assert_equal 'jenny', parsed_response['name']
  end

  def test_can_get_an_individual_campaign
    trump_with_campaigns
    get "/api/campaigns/#{Campaign.last.id}"
    assert_equal 200, last_response.status
    assert parsed_response['winning_candidate']['name']
  end

  def test_can_create_a_candidate
    payload = { name: 'bob' }
    post '/api/candidates', payload.to_json
    assert_equal 201, last_response.status
    assert_equal 'bob', Candidate.last.name
  end

  def test_can_create_a_campaign
    gary
    trump
    payload = { candidate_ids: Candidate.pluck(:id) }
    post '/api/campaigns', payload.to_json
    assert_equal 201, last_response.status
    assert_equal [gary, trump], Campaign.last.candidates
  end


  def test_can_create_a_campaign_with_invalid_number_of_candidates
    gary
    payload = { candidate_ids: [Candidate.first.id] }
    post '/api/campaigns', payload.to_json
    assert_equal 422, last_response.status
  end

  def parsed_response
    @_parsed_response ||= JSON.parse(last_response.body) if last_response.body
  end
end
