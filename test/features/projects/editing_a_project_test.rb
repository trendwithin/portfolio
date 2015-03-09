require "test_helper"

feature "When I click edit so that I can update a previous post" do
  scenario "the post renders" do

    #given an existing post
    visit edit_project_path(projects(:portfolio))

    #When I decide to make changed
    fill_in "Name", with: "My First Post"
    click_on "Update Project"

    #Then the changes should be acknowledged, saved and shows
    page.text.must_include "successfully"
    page.text.must_include "First Post"
    page.text.wont_include "It was the best of times..."
  end

  scenario "incorrectly filling out the form during editing" do

    #Given an existing post
    visit edit_project_path(projects(:portfolio))

    #When I submit invalid data i.e. name too short
    fill_in "Name", with: "OMy"
    click_on "Update Project"

    #Then the changes should not be saved
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
