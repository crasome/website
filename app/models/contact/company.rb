module Contact
  class Company
    include Virtus.model strict: true

    attribute :name,   String, default: ""
    attribute :email,  String, default: ""
  end
end
