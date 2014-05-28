require 'spec_helper'

describe Contact::JoinUsController, type: :controller do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include ActionMailer::TestHelper

  let(:visitor) { build :engineer }
  let(:message) { build :message }

  it "emails join request to the company" do
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

  describe "on validation error" do
    let(:visitor) { build :engineer, :invalid }
    let(:message) { build :message }

    it "does not send the email" do
      assert_no_emails do
        post :create, format: :json,
          message: message.to_h,
          visitor: visitor.to_h
      end
    end

    it "responds with bad request" do
      post :create, format: :json,
        message: message.to_h,
        visitor: visitor.to_h

      assert_response :bad_request
      expect(response.body).to include "email"
    end
  end
end
