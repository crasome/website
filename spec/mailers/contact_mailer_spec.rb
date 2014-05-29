require "spec_helper"

describe ContactMailer do

  describe "join request" do
    let(:visitor) { build :engineer }
    let(:form) { Contact::JoinRequest.new visitor: visitor }
    let(:email) { described_class.join_request form }

    it "includes visitor occupation" do
      expect(email.body).to include visitor.occupation
    end
  end

  describe "hire request" do
    let(:company) { build :company }
    let(:visitor) { build :visitor }
    let(:form) { Contact::HireRequest.new company: company }
    let(:email) { described_class.hire_request form }

    it "includes company name" do
      expect(email.body).to include company.name
    end

    it "includes company email in from field" do
      expect(email.from).to include company.email
    end
  end
end
