class ContactMailer < ActionMailer::Base

  def message_to_us(message, from:)
    @content = message.content
    @visitor = from

    mail from: format_sender(from), subject: format_subject(message),
      to: 'info@crasome.com'
  end

  def join_us_request(message, from:)
    @content = message.content
    @visitor = from

    mail from: format_sender(from), subject: format_subject(message),
      to: 'hr@crasome.com'
  end

  def hire_us_request(message, from:)
    @content = message.content
    @visitor = from

    mail from: format_sender(from), subject: format_subject(message),
      to: 'sales@crasome.com'
  end

  private
  def format_sender(visitor)
    "\"#{visitor.name}\" <#{visitor.email}>"
  end

  def format_subject(message)
    "#{action_name.humanize} from crasome.com: #{message.title}"
  end
end
