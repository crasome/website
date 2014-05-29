require_relative "context_delegator"

module UiInteractions
  class JoinRequest < ContextDelegator

    def initialize(context)
      super(
        context,
        link:         "join_request",
        form_name:    "#join_request_form",
        form_submit:  "Send"
      )
    end

    def send_join_request(*args)
      visit contact_new_join_request_path
      fill_and_submit_form *args
    end

    private

    def fill_and_submit_form(message:, visitor:)
      within form_name do
        fill_in "visitor_name", with: visitor.name
        fill_in "visitor_email", with: visitor.email
        fill_in "visitor_occupation", with: visitor.occupation

        fill_in "message_title", with: message.title
        fill_in "message_content", with: message.content

        click_button form_submit
      end
    end
  end
end
