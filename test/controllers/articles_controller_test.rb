require "test_helper"

feature "It clicks new" do
  scenario "the page renders new article" do
  visit articles_path
  page.click_link('New Article')
  page.must_have_content "New Article"
  end
end

feature "It clicks Back" do
  scenario "the page returns to Articles" do
  visit new_article_path
  page.click_link('Back')
  page.must_have_content "New Article"
  end
end
