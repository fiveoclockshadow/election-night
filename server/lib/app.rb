# This is used to select which database to use.
ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'json'

require_relative 'database'
require_relative 'candidate'
require_relative 'enrollment'
require_relative 'campaign'

class App < Sinatra::Base
  # Serve any HTML/CSS/JS from the client folder
  set :static, true
  set :public_folder, proc { File.join(root, '..', '..', 'client', 'public') }

  # Enable the session store
  enable :sessions

  # This ensures that we always return the content-type application/json
  before do
    content_type 'application/json'
    begin
    @body_params = JSON.parse(request.body.read)
    rescue
      @body_params = {}
    end
  end

  helpers do

    def json_payload
      @body_params
    end

    def render_collection(collecton, args = {})
      code = args[:status] || 200
      args[:json_opts] ||= {}
      [code, collecton.to_json]
    end

    def render_json_or_errors(obj, args = {})
      code = args[:status] || 200
      args[:json_opts] ||= {}
      if obj.valid?
        [code, obj.as_json(args[:json_opts]).to_json]
      else
        [422, { errors: obj.errors.to_h }.to_json]
      end
    end
  end

  # DO NOT REMOVE THIS ENDPOINT IT ENABLES HOSTING HTML FOR THE FRONT END
  get '/' do
    content_type 'text/html'
    body File.read(File.join(settings.public_folder, 'index.html'))
  end

  ########## CANDIDATES
  get '/api/candidates' do
    render_collection(
      Candidate.all,
      status: 200
    )
  end

  get '/api/candidates/:id' do
    render_json_or_errors(
      Candidate.find(params['id']),
      status: 200,
      json_opts: { include: :campaigns }
    )
  end

  patch '/api/candidates/:id' do
    cadidates = Candidate.find(params['id'].update(json_payload))
    render_json_or_errors(cadidates, status: 201)
  end

  post '/api/candidates' do
    cadidates = Candidate.create(json_payload)
    render_json_or_errors(cadidates, status: 201)
  end

  ########## CAMPAIGNS

  get '/api/campaigns' do
    Candidate.all
  end

  get '/api/campaigns/:id' do
    Campaign.find(params['id'])
  end

  post '/api/campaigns/:id' do
    campaign = Campaign.create(params['id'])
    render_json_or_errors(campaign, status: 201)
  end

  # If this file is run directly boot the webserver
  run! if app_file == $PROGRAM_NAME
end
