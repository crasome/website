World MessageCucumberHelper

When(/^I choose the send message option$/) do
  click_link message.link
end

Then(/^I should see the message form$/) do
  expect(page).to have_css message_form.name
end

When(/^I send message$/) do
  @message = build :message
  @visitor = build :visitor
  create_message @message, @visitor
end

Then(/^email with my message should be sent$/) do
  expect(last_email.to).to include "info@crasome.com"
  expect(last_email.from).to include @visitor.email
end

Then(/^I should see a notification that my message sent$/) do
  expect(page).to have_content "sent"
end
