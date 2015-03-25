require "test_helper"

feature "Approve A Comment" do
  scenario "Site owner approves a comment" do

    visit comments_path
    page.must_have_content "Adding a comment"
    click_button "Accept"
    page.wont_have_content "Goobye All!"
  end
end
