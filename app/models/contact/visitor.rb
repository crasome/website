module Contact
  module Visitor
    include Virtus.module

    attribute :name,   String
    attribute :email,  String
  end
end
