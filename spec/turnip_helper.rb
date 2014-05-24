require_relative "spec_helper"

require 'capybara/rspec'
require 'capybara/rails'
require 'turnip/capybara' # for scopes

UiInteractions = Module.new
StepHelpers = Module.new

# TODO: autoload helpers
Dir[
  "spec/acceptance/steps/support/**/*.rb",
  "spec/acceptance/steps/step_helpers/**/*.rb",
  "spec/acceptance/steps/ui_interactions/**/*.rb",
].each { |f| require Rails.root.join f }

Dir[
  "spec/acceptance/steps/**/*_steps.rb",
].each { |f| require Rails.root.join f }
# default
RSpec.configure do |config|
  config.include PageSteps
  config.include StepHelpers::Page
end
