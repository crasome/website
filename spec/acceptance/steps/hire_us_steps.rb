steps_for :hire_us do
  include SharedSteps::Contact

  step "I send the :contact request" do |contact|
    @message = build :message
    @visitor = build :visitor
    @company = build :company

    interaction(contact).send_hire_request(
      message: @message,
      visitor: @visitor,
      company: @company
    )
  end

end
