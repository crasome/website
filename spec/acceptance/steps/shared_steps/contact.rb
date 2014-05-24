module SharedSteps::Contact
  include StepHelpers::Email

  step "I choose the :contact option" do |contact|
    click_link interaction(contact).link
  end

  step "I should see the :contact form" do |contact|
    expect(page).to have_css interaction(contact).form_name
  end

  step "email with my message/request should be sent to :email" do |email|
    expect(last_email.to).to include email
    expect(last_email.from).to include @visitor.email
  end

  step "I should see a notification that my :contact sent" do |contact|
    expect(page).to have_content "sent"
  end

  private
  def interaction(interaction_class)
    interaction_class.new self
  end
end

placeholder :contact do
  match(/join ?(us|request)?/) { UiInteractions::JoinUs }
  match(/(send )?message/)     { UiInteractions::SendMessage }
end
