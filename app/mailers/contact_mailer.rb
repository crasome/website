class ContactMailer < ActionMailer::Base
  def join_request(form, group = nil)
    group = ENV['EMAIL_GROUP_TO_JOIN']
    send_message form, group
  end

  def hire_request(form, group = nil)
    group ||= ENV['EMAIL_GROUP_TO_HIRE']
    send_message form, group
  end

  def send_message(form, group = nil)
    group ||= ENV['EMAIL_GROUP_TO_MESSAGE']
    @contact = contact form

    mail to: format_destination(group),
         **@contact.email_fields
  end

  def domain
    ENV['COMPANY_DOMAIN']
  end

  private
  def contact(form)
    Contact::EmailPresenter.new form, self
  end

  def format_destination(group)
    "#{group}@#{domain}"
  end
end
