class ContactMailer < ActionMailer::Base
  # TODO: move to config
  default to: 'info@crasome.com'


  def message_to_us(message, from:)
    @content = message.content
    @visitor_name = from.name

    mail from: format_sender(from), subject: format_subject(message)
  end

  private
  def format_sender(visitor)
    "\"#{visitor.name}\" <#{visitor.email}>"
  end

  def format_subject(message)
    "Message from crasome.com: #{message.title}"
  end
end
