module Contact
  class Engineer
    include Virtus.model strict: true

    attribute :name,      String,  default: ""
    attribute :email,     String,  default: ""
    attribute :position,  String,  default: ""
  end
end
