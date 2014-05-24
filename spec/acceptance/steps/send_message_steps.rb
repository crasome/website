module SendMessageSteps
  include UiInteractions::SendMessage
  include StepHelpers::Email

  step "I choose the send message option" do
    click_link message.link
  end

  step "I should see the message form" do
    expect(page).to have_css message_form.name
  end

  step "I send message" do
    @message = build :message
    @visitor = build :visitor
    create_message @message, @visitor
  end

  step "email with my message should be sent" do
    expect(last_email.to).to include "info@crasome.com"
    expect(last_email.from).to include @visitor.email
  end

  step "I should see a notification that my message sent" do
    expect(page).to have_content "sent"
  end
end

RSpec.configure { |c| c.include SendMessageSteps }
