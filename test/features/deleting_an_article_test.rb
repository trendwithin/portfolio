require "test_helper"

feature "Deleting an Article" do
  scenario "submit delets an existing article" do
    #Given an existing article
    article = Article.create(title: 'Day by Day a Code Fellow', body: 'Means small victories to excellence')
    visit articles_path(article)

    #When DELETE is clicked
    click_on "Destroy"
    page.wont_have_content "Day by Day"
  end
end
