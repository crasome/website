steps_for :send_message do
  include SharedSteps::Contact

  step "I send :contact" do |contact|
    @message = build :message
    @visitor = build :visitor
    interaction(contact).send_message @message, @visitor
  end

end
