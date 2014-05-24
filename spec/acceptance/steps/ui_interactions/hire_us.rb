require_relative "context_delegator"

module UiInteractions
  class HireUs < ContextDelegator

    def initialize(context)
      super(
        context,
        link:         "hire_us",
        form_name:    "#hire_us_form",
        form_submit:  "Send"
      )
    end

    def send_hire_request(message, visitor)
      visit new_contact_hire_us_path
      fill_and_submit_form message, visitor
    end

    private

    def fill_and_submit_form(message, visitor)
      within form_name do
        fill_in "visitor_name", with: visitor.name
        fill_in "visitor_email", with: visitor.email
        fill_in "visitor_company", with: visitor.company

        fill_in "message_title", with: message.title
        fill_in "message_content", with: message.content

        click_button form_submit
      end
    end
  end
end
