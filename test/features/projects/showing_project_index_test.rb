require "test_helper"

feature "Site visitors should be able to see my portfolio " do
  scenario "Viewing all projects" do

    visit projects_path
    page.text.must_include('Milton')
    page.text.must_include('Capn\' Crunch')
  end
end
