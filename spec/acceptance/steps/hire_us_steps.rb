steps_for :hire_us do
  include SharedSteps::Contact

  step "I send the :contact request" do |contact|
    @message = build :message
    @visitor = build :client
    interaction(contact).send_hire_request @message, @visitor
  end

end
