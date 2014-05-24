require 'spec_helper'

describe Contact::MessagesController, :type => :controller do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "sends message to the company" do
    post :create, format: :json,
      message: {
        title: "Hello!",
        content: "Hello World!"
      },
      visitor: {
        name: "Rspec",
        email: "rspec@example.com"
      }
      email = open_last_email

      expect(email.from).to include "rspec@example.com"
      expect(email.to).to include "info@crasome.com"

      expect(email).to have_subject /Hello!/
      expect(email).to have_body_text "Hello World!"
  end
end
