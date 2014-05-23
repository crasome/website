Then(/^I should see a homepage$/) do
  expect(page).to have_content "Welcome"
end

When(/^I visit the application$/) do
  visit root_path
end
