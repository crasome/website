module StepHelpers::Email
  def last_email
    ActionMailer::Base.deliveries.last or raise "No email sent"
  end
end
