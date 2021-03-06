# This is used to select which database to use.
ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'json'

require_relative 'database'
require_relative 'candidate'
require_relative 'enrollment'
require_relative 'campaign'
require_relative 'app_helpers'
require_relative 'array_monkey_patch'

class App < Sinatra::Base
  # Serve any HTML/CSS/JS from the client folder
  set :static, true
  set :show_exceptions, false
  set :raise_errors, false
  set :public_folder, proc { File.join(root, '..', '..', 'client', 'public') }

  # Enable the session store
  enable :sessions

  # This ensures that we always return the content-type application/json
  before do
    content_type 'application/json'
  end

  helpers AppHelpers

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
    render_one(
      Candidate.find(params['id']),
      json_opts: {
        include: :campaigns,
        methods: [:number_of_won_campaigns, :max_skill_points]
      }
    )
  end

  delete '/api/candidates/:id' do
    candidate = Candidate.find(params['id'])
    candidate.destroy
    render_one(candidate)
  end

  patch '/api/candidates/:id' do
    candidate = Candidate.find(params['id'])
    candidate.update(json_payload)
    render_one(candidate, status: 202)
  end

  post '/api/candidates' do
    candidate = Candidate.create(json_payload)
    render_one(candidate, status: 201)
  end

  ########## CAMPAIGNS

  get '/api/campaigns' do
    render_collection(
      Campaign.all
    )
  end

  get '/api/campaigns/:id' do
    render_one(
      Campaign.find(params['id']),
      json_opts: { include: [:winning_candidate, :candidates] }
    )
  end

  post '/api/campaigns' do
    campaign = Campaign.new(json_payload)
    campaign.fight!
    campaign.save
    render_one(campaign, status: 201, json_opts: { include: :winning_candidate })
  end

  error ActiveRecord::RecordNotFound do
    status 404
    { errors: { messages: env['sinatra.error'].message } }.to_json
  end

  error ActiveModel::UnknownAttributeError do
    status 422
    { errors: { messages: env['sinatra.error'].message } }.to_json
  end

  error do
    status 500
    { errors: { messages: env['sinatra.error'].message } }.to_json
  end

  not_found do
    status 404
    { errors: { messages: 'HTTP VERB + Path not found 404' } }.to_json
  end

  # If this file is run directly boot the webserver
  run! if app_file == $PROGRAM_NAME
end
