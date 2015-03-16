require 'test_helper'

feature 'Creating an article' do
  scenario "Submit form data to create a new article" do

    sign_in(:author)
    visit articles_path
    click_on 'New Article'
    fill_in "Title", with: "Spring is Near"
    fill_in "Body", with: "Time to toss the rain coats! Oh wait, this is Seattle"

    #When form submitted
    click_on "Create Article"
    #Then a new article should be created and dispalyed
    page.text.must_include "Article was successfully"
    page.text.must_include "this is Seattle"
    page.text.must_include "Status: Unpublished"
  end

  scenario "Unauthorized site visitors cannot see new article button" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    fill_in "Title", with: "Spring is Near"
    fill_in "Body", with: "Time to toss the rain coats! Oh wait, this is Seattle"
    click_on "Create Article"
    page.wont_have_field('Published')
  end

  scenario "Editors can publish" do
    sign_in(:editor)
    visit new_article_path

    fill_in "Title", with: articles(:cr).title
    fill_in "Body", with: articles(:cr).body
    page.must_have_field('Published')
    check "Published"
    click_on "Create Article"
    page.text.must_include "Status: Published"
  end

  scenario "Author can not edit another authors post" do
    sign_in(:author)
    visit edit_article_path(articles(:cr))
    page.text.wont_include("Update")
  end
end
