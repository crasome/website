require "form_validation"

module Contact
  class JoinRequest
    include Virtus.model
    include FormValidation

    attribute :message,  Message,   default: Message.new
    attribute :visitor,  Engineer,  default: Engineer.new

    validates "message.title",  presence: true, length: { minimum: 5, maximum: 200 }
    validates "message.content",  presence: true, length: { mimumin: 10, maximum: 5000 }

    validates "visitor.occupation",  presence: true, length: { minimum: 5, maximum: 100 }
    validates "visitor.name",        presence: true
    validates "visitor.email",       presence: true,
                                     email: true

  end
end
