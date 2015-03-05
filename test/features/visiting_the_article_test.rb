require "test_helper"
#given the following
feature "Clickning Blog Link on Home Page" do
  #when this happens
  scenario "Renders Article page" do
    #then expect this behavior
    visit '/'
    click_link('Blog')
    page.must_have_content "Listing Articles"
    page.wont_have_content "Goobye All!"
  end
end


