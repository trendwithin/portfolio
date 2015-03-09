require "test_helper"
#Given
feature "Article View Renders" do
  #When
  scenario "the page returns Listing Articles" do
    #Does
    visit 'articles'
    page.must_have_content "Listing Articles"
    page.wont_have_content "Goobye All!"
  end
end
