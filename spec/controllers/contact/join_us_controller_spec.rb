require 'spec_helper'

describe Contact::JoinUsController, :type => :controller do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  it "sends join request to the company" do
    message = build :message
    visitor = build :engineer

    post :create, format: :json,
      message: message.to_h,
      visitor: visitor.to_h

    email = open_last_email

    expect(email.to).to include "hr@crasome.com"
    expect(email.from).to include visitor.email

    expect(email).to have_body_text visitor.occupation

    expect(email).to have_subject /#{message.title}/
    expect(email).to have_body_text message.content
  end
end
