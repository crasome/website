module Contact
  class Engineer
    include Virtus.model strict: true
    include Visitor

    attribute :occupation,  String
  end
end
