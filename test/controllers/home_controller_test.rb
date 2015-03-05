require "test_helper"

feature "When Access Home Page" do
  scenario "the title returns Home" do
    visit '/'
    page.has_title? "Home"

  end
end
