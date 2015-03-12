require "test_helper"

feature "As a User with an account I should be able to sign in" do
  scenario "Click sign in" do

    #Given A user signs in
    visit '/'
    click_on "Sign in"

    #When the user name and password is correct
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: users(:mackey).password
    visit new_article_path
    save_and_open_page

    #Then the page renders a correspoding sign out link
    page.must_have_content "Sign out"
  end
end
