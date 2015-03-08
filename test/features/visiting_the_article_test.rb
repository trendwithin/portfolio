require "test_helper"

feature "Creating an article" do
  scenario "submit form data to create a new article" do

    #Given a completed new article form
    visit articles_path
    click_link('New Article')
    fill_in('Title', with: articles(:cr).title)
    fill_in('Body', with: articles(:cr).body)

    #when I submit the form
    click_on "Create Article"

    #then there should be the following text
    page.text.must_include "Article was successfully created"
    page.text.must_include "Code"
  end
end
