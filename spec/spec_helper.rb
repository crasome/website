# This file is copied to spec/ when you run 'rails generate rspec:install'
require_relative 'spec_helper_lite'
require File.expand_path("../../config/environment", __FILE__)

# HACK: user Rspec without ActiveRecord
RSpec::Rails::FixtureSupport = Module.new

require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
end
