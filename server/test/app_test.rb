require_relative 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods
  include Fixtures

  def app
    App
  end

  def test_root_route
    get '/'
    assert_equal(File.read(File.expand_path('../client/public/index.html')), last_response.body)
  end

  def test_can_handle_junk
    post '/api/candidates', 'asdf'
    assert_match /JSON/, parsed_response['errors']['messages']
    assert_equal 500, last_response.status
  end

  def test_can_handle_junk_endpoints
    post '/api/asdf', 'asdf'
    assert_match /HTTP VERB/, parsed_response['errors']['messages']
    assert_equal 404, last_response.status
  end

  def test_can_handle_404_cleanly
    trump
    get "/api/candidates/#{Candidate.last.id + 1 }"
    assert_match /Couldn't find Candidate/, parsed_response['errors']['messages']
    assert_equal 404, last_response.status
  end
end
