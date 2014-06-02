class ContactMailer < ActionMailer::Base
  DOMAIN = "crasome.com"

  def join_request(form)
    send_message(form)
  end

  def hire_request(form)
    send_message(form)
  end

  def send_message(form)
    @contact = contact form

    mail to: format_destination("hello"),
         **@contact.email_fields
  end

  def domain
    DOMAIN
  end

  private
  def contact(form)
    Contact::EmailPresenter.new form, self
  end

  def format_destination(group)
    "#{group}@#{domain}"
  end
end
