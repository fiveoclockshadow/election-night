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

  def test_can_index_candidates
    trump
    get '/candidates'
    assert last_response.ok?
    assert_equal Array, parsed_response
    assert_equal 'Trump', parsed_response.first['name']
  end

  def parsed_response
    JSON.parse(last_response.body) if last_response.body
  end
end
