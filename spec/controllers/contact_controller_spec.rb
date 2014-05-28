require 'spec_helper'
require_relative 'contact_shared_specs'

describe ContactController, type: :controller do
  let(:message) { build :message }

  describe "join us" do
    let(:action) { :join_us }
    let(:visitor) { build :engineer }
    let(:email_to) { "hr@crasome.com" }
    let(:email_request) { :join_us_request }

    include_examples "contact us"
  end

  describe "hire us" do
    let(:action) { :hire_us }
    let(:visitor) { build :visitor }
    let(:email_to) { "sales@crasome.com" }
    let(:email_request) { :hire_us_request }

    include_examples "contact us"
  end

  describe "send message" do
    let(:action) { :send_message }
    let(:visitor) { build :visitor }
    let(:email_to) { "info@crasome.com" }
    let(:email_request) { :send_message }

    include_examples "contact us"
  end
end
