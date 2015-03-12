=begin
require "test_helper"

feature "As a Site owner, I want to be able to sign out a user to prevent abuse " do
  scenario "Click Sign-out for user" do
    visit '/'
    click_on "Sign Up"

    #When user registers with valid info
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    #Then user should be signed up
   page.must_have_content "Welcome! You have signed up successfully."
   page.must_have_content "Sign out"
   page.wont_have_content "There was a problem with your sign up"
   click_on "Sign out"
   page.must_have_content "Signed out successfully"
  end
end
=end
