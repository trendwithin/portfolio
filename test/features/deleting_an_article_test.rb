require "test_helper"

feature "Deleting an Article" do
  scenario "submit delets an existing article" do
    #Given an existing article
    article = Article.create(title: 'Day', body: 'Means small victories to excellence')
    visit articles_path(article)


    #When DELETE is clicked
    @javascript
    find('tr', text: 'Day') { click_link 'Destroy' }
    sleep 1
    page.driver.browser.accept_js_confirms
    visit articles_path
    page.wont_have_content "Day by"
  end
end

