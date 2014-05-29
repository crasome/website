require "spec_helper"

describe Contact::EmailPresenter do
  let(:presenter) { described_class.new form, double.as_null_object }
  let(:message) { build :message }
  let(:visitor) { build :visitor }
  let(:company) { build :company }

  let(:form) { Contact::HireUsForm.new visitor: visitor,
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
end
