require_relative "context_delegator"

module UiInteractions
  class HireRequest < ContextDelegator

    def initialize(context)
      super(
        context,
        link:         "hire_request",
        form_name:    "#hire_request_form",
        form_submit:  "Send"
      )
    end

    def send_hire_request(*args)
      visit contact_new_hire_request_path
      fill_and_submit_form *args
    end

    private

    def fill_and_submit_form(message:, visitor:, company:)
      within form_name do
        fill_in "visitor_name",   with: visitor.name
        fill_in "visitor_email",  with: visitor.email

        fill_in "company_name",   with: company.name
        fill_in "company_email",  with: company.email

        fill_in "message_title",    with: message.title
        fill_in "message_content",  with: message.content

        click_button form_submit
      end
    end
  end
end
