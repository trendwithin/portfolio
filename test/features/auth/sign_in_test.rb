require "test_helper"

feature "As a User with an account I should be able to sign in" do
  scenario "Click sign in" do
    visit '/'
    click_on "Sign in"
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: users(:mackey).password
    visit new_article_path
     save_and_open_page
    #page.must_have_content "Sign out"

    #click_on "Sign out"
    #page.must_have_content "Signed out successfully"
  end
end
