module PageSteps
  step "I am on the homepage" do
    visit root_path
  end

  step "I should see a homepage" do
    expect(page).to have_content "Welcome"
  end

  step "I visit the application" do
    visit root_path
  end
end
