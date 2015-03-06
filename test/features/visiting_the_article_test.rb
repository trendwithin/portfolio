require "test_helper"

feature "Creating an article" do
  scenario "submit form data to create a new article" do
    #Given a completed new article form
    visit articles_path
    click_link('New Article')
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make web apps"

    #when I submit the form
    click_on "Create Article"

    #then
    page.text.must_include "Article was successfully created"
    page.text.must_include "how I learned to make web apps"
  end
end

feature "When the page has articles" do
  scenario "Click show renders article" do
  #Given a completed new article
  visit new_article_path
  fill_in "Title", with: "Code Rails"
  fill_in "Body", with: "This is how I learned to make web apps"

  #when I submit the form
  click_on "Create Article"

  #given a list of articles to show
  visit articles_path
  page.click_link "Show"

  #then
  page.text.must_include "This is how I learned to make web apps"
  end
end


