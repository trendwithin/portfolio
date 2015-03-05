require "test_helper"

feature "CanAccessHome" do
  scenario "the page returns Welcome" do
    visit '/'
    page.must_have_content "Welcome"
    page.wont_have_content "Goobye All!"
  end
end
