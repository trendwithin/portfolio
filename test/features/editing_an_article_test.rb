require "test_helper"

feature "Ability to edit and modify a blog post" do
  scenario "Clicking edit button brings up blog post" do

    visit articles_path
    click_link 'New Article'
    #given
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make web apps"

  #when I submit the form
  click_on "Create Article"

  #given a list of articles to show
  visit articles_path
  click_link "Edit"

  #Given a modification to the blog post
  fill_in "Title", with: "One"
  fill_in "Body", with: "Two"

  #when I submit the update
  click_on "Update Article"
   visit articles_path
   page.must_have_content "One"
   page.must_have_content "Two"
  end
end

