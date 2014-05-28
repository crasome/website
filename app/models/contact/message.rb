module Contact
  class Message
    include Virtus.model strict: true

    attribute :title,    String, default: ""
    attribute :content,  String, default: ""
  end
end
