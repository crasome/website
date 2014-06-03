require "form_validation"

module Contact
  class JoinRequest
    include Virtus.model
    include FormValidation

    attribute :message,  Message,   default: Message.new
    attribute :visitor,  Engineer,  default: Engineer.new

    validates "message.title",                     length: { minimum: 5,   maximum: 256 }, allow_blank: true
    validates "message.content",  presence: true,  length: { mimumin: 10,  maximum: 5000 }

    validates "visitor.position",  presence: true,  length: { minimum: 5,  maximum: 100 }
    validates "visitor.name",      presence: true
    validates "visitor.email",     presence: true,
                                   email: true

  end
end
