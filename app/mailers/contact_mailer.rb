class ContactMailer < ActionMailer::Base
  DOMAIN = "crasome.com"

  def join_request(form)
    @contact = contact form

    mail to: format_destination("hr"),
         **@contact.email_fields
  end

  def hire_request(form)
    @contact = contact form

    mail to: format_destination("sales"),
         **@contact.email_fields
  end

  def send_message(form)
    @contact = contact form

    mail to: format_destination("info"),
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
