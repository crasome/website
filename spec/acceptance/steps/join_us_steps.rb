steps_for :join_us do
  include SharedSteps::Contact

  step "I send the :contact request" do |contact|
    @message = build :message
    @visitor = build :engineer
    interaction(contact).send_join_request @message, @visitor
  end

  step "I send the invalid :contact request" do |contact|
    @message = build :message
    @visitor = build :engineer, :invalid
    interaction(contact).send_join_request @message, @visitor
  end

end
