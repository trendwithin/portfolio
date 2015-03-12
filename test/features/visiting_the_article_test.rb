require "test_helper"

feature "When visitor visits the article page then creates an article" do
  scenario "submit form data to create a new article" do

    #Given a completed new article
    visit new_user_session_path
    fill_in "Email", with: users(:mackey).email
    fill_in "Password", with: "password"
    click_on "Log in"
    visit new_article_path
    visit articles_path

    click_on('New Article')

    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)
    #when I submit the form

    click_on "Create Article"

    #then there should be the following text
    page.text.must_include "Article was successfully created"
    page.text.must_include "Code"
    page.has_css? "#author"
    page.text.must_include users(:mackey).email
  end
end
