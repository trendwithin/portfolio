require "test_helper"

feature "CanAccessHome" do
  scenario "the page returns Welcome" do
    visit '/'
    page.must_have_content "Blog"
    page.wont_have_content "Goobye All!"
  end
end

#Given A Click on Home Page's Blog Link
feature "Click Block Link on Home Page" do
  scenario "Render Articles" do

    # Given a  user visits home
    visit '/'

    # When a user clicks Ruby
    click_link('Ruby')

    # Then a listing of articles renders
    page.must_have_content "Listing"
    page.wont_have_content "NOTHING TO SEE HERE"
  end
end
