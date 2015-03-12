require "test_helper"

feature "As a User with an account I should be able to sign in" do
  scenario "Click sign in" do

    #Given A user signs in
    visit '/'
    click_on "Login"

    #When the user name and password is correct
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on 'Log in'

    #Then the page renders a correspoding sign out link
    page.must_have_content "Signed"
  end
end

