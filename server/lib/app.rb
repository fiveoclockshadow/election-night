# This is used to select which database to use.
ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'json'

require_relative 'database'

class App < Sinatra::Base
  # Serve any HTML/CSS/JS from the client folder
  set :static, true
  set :public_folder, proc { File.join(root, '..', '..', 'client', 'public') }

  # Enable the session store
  enable :sessions

  # This ensures that we always return the content-type application/json
  before do
    content_type 'application/json'
  end

  helpers do
  def respond_with_or_errors(code, obj)
    if obj.valid?
      [code, obj.to_json]
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

  # You can delete this route but you should nest your endpoints under /api
  get '/api/candidates' do
    Candidate.all.to_json
  end

  get '/api/campaigns' do
    Candidate.all.to_json
  end

  get '/api/campaigns/:id' do
    Campaign.find(params['id']).to_json
  end

  get '/api/candidates/:id' do
    Candidate.find(params['id']).to_json
  end

  post '/api/campaigns/:id' do
    campaign = Campaign.create(params['id']).to_json
    respond_with_or_errors(201, campaign)
  end

  post '/api/candidates/:id' do
    cadidates = Candidate.new(params['id']).to_json
    respond_with_or_errors(201, cadidates)
  end


  # If this file is run directly boot the webserver
  run! if app_file == $PROGRAM_NAME
end
