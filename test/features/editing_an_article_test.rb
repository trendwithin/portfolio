require "test_helper"

feature "Ability to edit and modify a blog post" do
  scenario "Clicking edit button brings up blog post" do

    #Given a modification to the blog post
    visit new_user_session_path
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on "Log in"
    visit articles_path
    page.must_have_content "Code"
    within('tr', text: 'Code') { click_link 'Edit' }
    fill_in "Title", with: "One"
    fill_in "Body", with: "Two"
    current_path

    #when I submit the update
    click_on "Update Article"

    #Then the page should update
    page.must_have_content "One"
    page.must_have_content "Two"
  end
end

