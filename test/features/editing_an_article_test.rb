require "test_helper"
=begin
feature "Ability to edit and modify a blog post" do
  scenario "Clicking edit button brings up blog post" do

    #Given an existing article
    article = articles(:cr)
  #given a list of articles to show
  visit articles_path
  #save_and_open_page
  click_on("Edit")

  #Given a modification to the blog post
  page.must_have_content "accelrator"
  fill_in "Title", with: "One"
  fill_in "Body", with: "Two"

  #when I submit the update
  click_on "Update Article"
   visit articles_path
   page.must_have_content "One"
   page.must_have_content "Two"
  end
end
=end
