require "test_helper"

feature "Write A Comment" do
  scenario "An author post a comment" do

    sign_in(:author)
    visit article_path(articles(:mic))
    click_on "Comment"
    fill_in "Content", with: "Adding a comment"
    click_button "Comment"
    page.text.must_include "Comment sent"
  end

  scenario "No text in comment box" do
    sign_in(:author)
    visit article_path(articles(:mic))
    click_on "Comment"
    click_button "Comment"
    page.text.must_include "Unable to send the comment"
  end
end
