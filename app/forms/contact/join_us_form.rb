require "form_validation"

module Contact
  class JoinUsForm
    include Virtus.model
    include FormValidation

    attribute :message, Message
    attribute :visitor, Engineer

    validates "message.title",  presence: true, length: { minimum: 5, maximum: 200 }
    validates "message.content",  presence: true, length: { mimumin: 10, maximum: 5000 }

    validates "visitor.name",  presence: true
    validates "visitor.email", presence: true,
                               email: true

  end
end
