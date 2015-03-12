require "test_helper"

feature "As a site owner, users must authenticate before being able to create/edit post" do
  scenario "Authenticate user through sign up form" do

    #Given a registration form
    visit '/'
    click_on "Sign Up"
    page.must_have_content "Email"
    page.must_have_content "Password"

    #when valid info is registered
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    save_and_open_page
    #then a user should be signed up
    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"
  end
end
