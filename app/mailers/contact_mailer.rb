class ContactMailer < ActionMailer::Base
  DOMAIN = "crasome.com"

  def join_us_request(contact_form)
    message = contact_form.message
    @visitor = contact_form.visitor
    @content = message.content

    mail from: format_sender(@visitor), subject: format_subject(message),
      to: format_destination("hr")
  end

  def hire_us_request(contact_form)
    message = contact_form.message
    @visitor = contact_form.visitor
    @company = contact_form.company
    @content = message.content

    from = contact_form.contacts.map do |contact|
      format_sender(contact)
    end

    mail from: from, subject: format_subject(message),
      to: format_destination("sales")
  end

  def send_message(contact_form)
    message = contact_form.message
    @visitor = contact_form.visitor
    @content = message.content

    mail from: format_sender(@visitor), subject: format_subject(message),
      to: format_destination("info")
  end


  private
  def format_sender(visitor)
    return visitor.email unless visitor.name.present?
    "\"#{visitor.name}\" <#{visitor.email}>"
  end

  def format_subject(message)
    "#{action_name.humanize} from #{DOMAIN}: #{message.title}"
  end

  def format_destination(group)
    "#{group}@#{DOMAIN}"
  end
end
