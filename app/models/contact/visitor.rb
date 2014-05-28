module Contact
  class Visitor
    include Virtus.model strict: true

    attribute :name,   String, default: ""
    attribute :email,  String, default: ""
  end
end
