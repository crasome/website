require "json"

module Contact
  class EmailPresenter
    include Concord.new(:form, :context)

    def visitor_contact
      format_contact form.visitor
    end

    def company_contact
      format_contact form.company
    end

    def message
      form.message.content
    end

    def details
      pretty_print form
    end

    def email_fields(**email_options)
      @email_fields ||= {
        from: contacts,
        subject: subject
      }.merge! email_options
    end

    def method_missing(method, *attributes)
      form.send method, *attributes
    end

    private
    def format_contact(contact)
      return contact.email if contact.name.blank?
      return contact.name  if contact.email.blank?
      "\"#{contact.name}\" <#{contact.email}>"
    end

    def subject
      "#{context.action_name.humanize} from #{context.domain}. #{form.message.title}"
    end

    def contacts
      [form.try(:visitor), form.try(:company)].compact.delete_if do |contact|
        contact.email.blank?
      end.map do |contact|
        format_contact contact
      end
    end

    def pretty_print(object)
      JSON.pretty_generate extract_attributes(object.attributes)
    end

    def extract_attributes(attributes)
      attributes.each_with_object({}) do |(attribute, value), object|
        extracted_value = value.respond_to?(:attributes) ? extract_attributes(value.attributes) : value
        object[attribute] = extracted_value if extracted_value.present?
      end
    end

  end
end
