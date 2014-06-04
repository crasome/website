require "spec_helper"

describe Contact::EmailPresenter do
  let(:presenter) { described_class.new form, double.as_null_object }
  let(:message) { build :message }
  let(:visitor) { build :visitor }
  let(:company) { build :company }

  let(:form) { Contact::HireRequest.new visitor: visitor,
                                     company: company,
                                     message: message }

  describe "details" do
    it "pretty prints the form details" do
      details = presenter.details
      expect(details).to include message.content
      expect(details).to include visitor.name
      expect(details).to include company.name
      expect(details).to include company.email
    end
  end

  describe "visitor_contact" do
    it "retuns the name and email" do
      email_contact = presenter.visitor_contact

      expect(email_contact).to include "<#{visitor.email}>"
      expect(email_contact).to include visitor.name
    end

    it "retuns the email when no name defined" do
      visitor.name = ""
      email_contact = presenter.visitor_contact

      expect(email_contact).to eq visitor.email
    end
  end
end
