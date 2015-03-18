require "test_helper"

feature "As an Editor I should be able to view others comments" do
  scenario "when I click view comments show up" do
    visit new_user_session_path
    sign_in(:editor)

  end

  scenario "As an Editor I am able to moderate which comments to post" do

  end

  scenario "As an Editor I am able to delete post" do

  end

  scenario "As an Editor I am able to edit post" do

  end
end

feature "As an Author I should be able to approve comments" do
  scenario "When I click view, comments show" do

  end

  scenario "When I click publish the comment is published" do

  end

end
