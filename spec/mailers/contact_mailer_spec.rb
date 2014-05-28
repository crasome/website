require "spec_helper"

describe ContactMailer do

  describe "join us" do
    let(:visitor) { build :engineer }
    let(:form) { Contact::JoinUsForm.new visitor: visitor }
    let(:email) { described_class.join_us_request form }

    it "includes visitor occupation" do
      expect(email.body).to include visitor.occupation
    end
  end

  describe "hire us" do
    let(:company) { build :company }
    let(:visitor) { build :visitor }
    let(:form) { Contact::HireUsForm.new company: company }
    let(:email) { described_class.hire_us_request form }

    it "includes company name" do
      expect(email.body).to include company.name
    end

    it "includes company email in from field" do
      expect(email.from).to include company.email
    end
  end
end
