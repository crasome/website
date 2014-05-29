require "spec_helper"

describe Contact::HireRequest do
  let(:visitor) { build :visitor }
  let(:company) { build :company }
  let(:message) { build :message }
  let(:form) { described_class.new visitor: visitor,
                                   company: company,
                                   message: message }

  describe "#contacts" do
    it "returns an array of contacts" do
      expect(form.contacts).to eq [visitor, company]
    end

    it "includes only provided contacts" do
      visitor.email = ""

      expect(form.contacts).to eq [company]
    end

    specify "at least one contact email should be provided" do
      expect(form).to be_valid
      form.visitor.email = ""
      expect(form).to be_valid
      form.company.email = ""
      expect(form).not_to be_valid
    end
  end
end

