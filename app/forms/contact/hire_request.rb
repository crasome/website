require "form_validation"

module Contact
  class HireRequest
    include Virtus.model
    include FormValidation

    attribute :message, Message, default: Message.new
    attribute :visitor, Visitor, default: Visitor.new
    attribute :company, Company, default: Company.new

    validates "message.title",                     length: { minimum: 5, maximum: 256 }, allow_blank: true
    validates "message.content",  presence: true,  length: { mimumin: 10,  maximum: 5000 }

    validates "company.email", email: true, allow_blank: true
    validates "visitor.email", email: true, allow_blank: true

    validate do |form|
      form.errors.add("contacts", 'provide contact email') if contacts.empty?
    end

    def contacts
      [visitor, company].delete_if do |contact|
        contact.email.blank?
      end
    end
  end
end
