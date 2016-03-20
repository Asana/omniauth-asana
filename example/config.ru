require 'rubygems'
require 'bundler'
Bundler.setup

require './asana_oauth_helper'

run Sinatra::Application
