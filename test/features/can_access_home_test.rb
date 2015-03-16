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

  #when user clicks
  scenario "Render Articles" do
    visit '/'
    click_link('Ruby')
    page.must_have_content "Listing"
    page.wont_have_content "NOTHING TO SEE HERE"
  end
end
