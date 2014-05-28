module Contact
  class Message
    include Virtus.model strict: true

    attribute :title,    String
    attribute :content,  String
  end
end
