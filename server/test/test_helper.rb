# This is important, do not remove, and ensure it's included in every test or
# ensure this file is included
ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'simplecov'
SimpleCov.start

begin
  require 'pry'
rescue LoadError
end

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'rack/test'
require_relative 'support/fixtures'
require_relative '../lib/app'
