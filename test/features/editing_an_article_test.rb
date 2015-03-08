require "test_helper"

feature "Ability to edit and modify a blog post" do
  scenario "Clicking edit button brings up blog post" do
    #Given an existing article
    article = Article.create(title: 'Becoming a Code Fellow', body: 'Means small vicotories to excellence')

    #Given a modification to the blog post
    visit articles_path
    page.must_have_content "Becoming"
    within('tr', text: 'Becoming') { click_link 'Edit' }

    fill_in "Title", with: "One"
    fill_in "Body", with: "Two"

    #when I submit the update
    click_on "Update Article"
    visit articles_path
    page.must_have_content "One"
    page.must_have_content "Two"
  end
end

