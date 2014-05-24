require 'spec_helper'

describe Contact::MessagesController, :type => :controller do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "sends message to the company" do
    message = build :message
    visitor = build :visitor

    post :create, format: :json,
      message: message.to_h,
      visitor: visitor.to_h

    email = open_last_email

    expect(email.from).to include visitor.email
    expect(email.to).to include "info@crasome.com"

    expect(email).to have_subject /#{message.title}/
    expect(email).to have_body_text message.content
  end
end
