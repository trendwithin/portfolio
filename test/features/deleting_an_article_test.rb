require "test_helper"

feature "Deleting an Article"  do
  scenario "submit delets an existing article"  do

    #Given an existing article
    visit new_user_session_path
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on "Log in"

    visit articles_path
    page.must_have_content "Code"

    #When DELETE is clicked
    within('tr', text: 'Code') { click_link 'Destroy' }
    visit articles_path
    page.wont_have_content "Code Rails"
   end
 end
