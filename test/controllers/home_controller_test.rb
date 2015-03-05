require "test_helper"

feature "Access the Home Page" do
  scenario "the title returns Home" do
    visit '/'
    page.has_title? "Home"
  end
end

feature "Home Page Renders Blog Link" do
  scenario "For user to click to go to atricles" do
    visit '/'
    page.has_link? "Blog"
  end
end
