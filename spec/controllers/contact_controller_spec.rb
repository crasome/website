require 'spec_helper'
require_relative 'contact_shared_specs'

describe ContactController, type: :controller do
  let(:message) { build :message }
  let(:email_to) { "hello@crasome.com" }

  describe "join request" do
    let(:action) { :join_request }
    let(:visitor) { build :engineer }

    include_examples "contact"
  end

  describe "hire request" do
    let(:action) { :hire_request }
    let(:visitor) { build :visitor }

    include_examples "contact"
  end

  describe "send message" do
    let(:action) { :send_message }
    let(:visitor) { build :visitor }

    include_examples "contact"
  end
end
