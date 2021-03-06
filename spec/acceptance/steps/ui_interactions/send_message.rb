require_relative "context_delegator"

module UiInteractions
  class SendMessage < ContextDelegator

    def initialize(context)
      super(
        context,
        link:         "send_message",
        form_name:    "#send-message-form",
        form_submit:  "Send"
      )
    end

    def send_message(*args)
      visit contact_new_message_path
      fill_and_submit_form *args
    end

    private

    def fill_and_submit_form(message:, visitor:)
      within form_name do
        fill_in "visitor.name", with: visitor.name
        fill_in "visitor.email", with: visitor.email

        fill_in "message.title", with: message.title
        fill_in "message.content", with: message.content

        click_button form_submit
        sleep 1.0/12.0
      end
    end
  end
end
