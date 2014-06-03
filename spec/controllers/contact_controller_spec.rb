require 'spec_helper'
require_relative 'contact_shared_specs'

describe ContactController, type: :controller do
  let(:message) { build :message }

  describe "join request" do
    let(:action) { :join_request }
    let(:visitor) { build :engineer }
    let(:email_to) { "hr@crasome.com" }

    include_examples "contact"
  end

  describe "hire request" do
    let(:action) { :hire_request }
    let(:visitor) { build :visitor }
    let(:email_to) { "sales@crasome.com" }

    include_examples "contact"
  end

  describe "send message" do
    let(:action) { :send_message }
    let(:visitor) { build :visitor }
    let(:email_to) { "info@crasome.com" }

    include_examples "contact"
  end
end
