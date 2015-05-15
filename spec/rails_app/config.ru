# This file is used by Rack-based servers to start the application.

ENV['BUNDLE_GEMFILE'] = '../../Gemfile'
require 'sms_ru'

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
