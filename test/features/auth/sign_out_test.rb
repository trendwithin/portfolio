require "test_helper"

feature "As a Site owner, I want to be able to sign out a user to prevent abuse " do
  scenario "Click Sign-out for user" do

    #given a user signs up
    visit '/'
    click_on "Login"

    #When user registers with valid info
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_button "Log in"

    #Given a valid sign up, sign the user out
    page.must_have_content "Signed"
    click_on "Logout"
    page.must_have_content "Signed out successfully"
  end
end

