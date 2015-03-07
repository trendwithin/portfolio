require "test_helper"

describe Article do
  let(:article_params) { { title: 'First Blog Post', body: 'First Content' } }
  let(:article) { Article.new  article_params }

  it "must be valid" do
    article.must_be :valid?
  end
end
  #Verify why this returns valid
=begin
  it "is invalid without a title" do
    article_params.delete :title
    article.wont_be :valid?
  end
=end
=begin
feature "Creating an article do" do
  scenario "submit form data to create a new article" do
  visit new_article_path
  fill_in "Title", with: articles(:cr).title
  fill_in "Body", with: articles(:cr).body

  click_on "Create Article"
  page.text.must_include "Article was successful"
  page.text.must_include articles(:cr).title
end
end
=end
