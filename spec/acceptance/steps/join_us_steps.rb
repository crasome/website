steps_for :join_us do
  include SharedSteps::Contact

  step "I send the :contact request" do |contact|
    @message = build :message
    @visitor = build :engineer
    interaction(contact).send_join_request @message, @visitor
  end

end
