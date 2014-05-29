module SharedSteps::Contact
  include StepHelpers::Email

  step "I choose the :contact option" do |contact|
    first(:link, interaction(contact).link).click
  end

  step "I should see the :contact form" do |contact|
    expect(page).to have_css interaction(contact).form_name
  end

  step "email with my message/request should be sent" do
    expect(last_email.body).to include @message.content
    expect(last_email.from).to include @visitor.email
  end

  step "I should see a notification that my :contact sent" do |contact|
    expect(page).to have_content "sent"
  end

  step "I should see errors in my :contact" do |contact|
    expect(page).to have_content "validation failed"
  end

  private
  def interaction(interaction_class)
    interaction_class.new self
  end
end

placeholder :contact do
  match(/join( request)?/) { UiInteractions::JoinRequest }
  match(/hire( request)?/) { UiInteractions::HireRequest }
  match(/(send )?message/) { UiInteractions::SendMessage }
end
