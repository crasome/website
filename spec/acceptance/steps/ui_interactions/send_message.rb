module UiInteractions::SendMessage
  def message
    OpenStruct.new({
      :link => "send_message",
    })
  end

  def message_form
    OpenStruct.new({
      :name => "#message_form",
      :submit => "Send",
    })
  end

  def create_message(message, visitor)
    visit new_contact_message_path
    fill_and_submit_form message, visitor
  end

  private

  def fill_and_submit_form(message, visitor)
    within message_form.name do
      fill_in "visitor_name", with: visitor.name
      fill_in "visitor_email", with: visitor.email

      fill_in "message_title", with: message.title
      fill_in "message_content", with: message.content

      click_button message_form.submit
    end
  end
end
