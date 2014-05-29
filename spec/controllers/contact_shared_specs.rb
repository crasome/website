shared_examples_for "contact" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include ActionMailer::TestHelper

  it "sends the message to the company" do
    post action, format: :json,
      message: message,
      visitor: visitor

    email = open_last_email

    expect(email.to).to include email_to
    expect(email.from).to include visitor.email

    expect(email).to have_subject /#{message.title}/
    expect(email).to have_body_text message.content
  end

  it "use the ContactMailer" do
    expect(ContactMailer).to receive(action) { double.as_null_object }

    post action, format: :json,
      message: message,
      visitor: visitor
  end

  describe "on validation error" do
    let(:visitor) { build :engineer, :invalid }
    let(:message) { build :message }

    it "does not send the email" do
      assert_no_emails do
        post action, format: :json,
          message: message,
          visitor: visitor
      end
    end

    it "responds with bad request" do
      post action, format: :json,
        message: message,
        visitor: visitor

      assert_response :bad_request
      expect(response.body).to include "email"
    end
  end
end
