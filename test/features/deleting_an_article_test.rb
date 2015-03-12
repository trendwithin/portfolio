require "test_helper"

feature "Deleting an Article"  do
  scenario "submit delets an existing article"  do

    #Given an existing article
    article = Article.create(title: 'Day', body: 'Means small victories to excellence')
    visit new_user_session_path
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on "Log in"
    visit articles_path(article)
    page.must_have_content "Day"

    #When DELETE is clicked
    within('tr', text: 'Day') { click_link 'Destroy' }
    visit articles_path
    page.wont_have_content "Day"
   end
 end
