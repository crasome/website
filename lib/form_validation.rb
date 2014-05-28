require "active_model"
class ValidationError < StandardError
  attr_reader :errors

  def initialize(errors)
    super errors.full_messages.join ", "
    @errors = errors
  end
end

module FormValidation
  def self.included(base)
    base.include ActiveModel::Validations
    base.include InstanceMethods
  end

  module InstanceMethods
    def validate!
      raise ValidationError, errors if invalid?
    end

    def read_attribute_for_validation(attribute)
      attribute.split(".").inject(self) do |model, attribute_name|
        model.send attribute_name
      end
    end
  end
end
