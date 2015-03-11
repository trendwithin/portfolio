require "test_helper"

feature "As an owner, I want to be able to restrict users actions by having them sign up for access" do
  scenario "User clicks sign up button" do
    #Given a registration form
    visit '/'
    click_on "Sign Up"

    #When user registers with valid info
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    #Then user should be signed up

    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"
  end
end
