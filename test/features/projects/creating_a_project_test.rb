require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do

    #Given I render the new project page
    visit projects_path
    click_on "New project"

     #When I fill in the pertinent fields
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

     #Then create the project, I am alerted a new project has been created
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end

  scenario "Minimum or maximum character limit not met or exceeded" do

    #Given I render a new projects page
    visit projects_path
    click_on "New project"

    #when the name fields or technology_used field don't meet input requirements
    fill_in "Name", with: "O"
    fill_in "Technologies used", with: ""
    click_on "Create Project"

    #Then the project should not be saved
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "can't be blank"
  end
end

