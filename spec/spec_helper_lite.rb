require 'pry'

ENV['RAILS_ENV'] ||= 'test'
require "rspec"
require "support/rspec_shared_configuration"

$: << File.expand_path('../lib', File.dirname(__FILE__))
$: << File.expand_path('../app', File.dirname(__FILE__))
