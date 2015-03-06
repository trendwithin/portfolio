require "test_helper"

feature "It clicks new" do
  scenario "the page renders new article" do
  visit articles_path
  page.click_link('New Article')
  page.must_have_content "New Article"
  end
end

feature "It clicks Back" do
  scenario "the page returns to Articles" do
  visit new_article_path
  page.click_link('Back')
  page.must_have_content "New Article"
  end
end

feature "Creating an article" do
  scenario "submit form data to create a new article" do
    #Given a completed new article form
    visit new_article_path
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make web apps"

    #when I submit the form
    click_on "Create Article"

    #then
    page.text.must_include "Article was successfully created"
    page.text.must_include "how I learned to make web apps"
  end
end


=begin

feature "Article View Renders" do
  scenario "the page returns Listing Articles" do
    visit 'articles'
    page.must_have_content "Listing Articles"
    page.wont_have_content "Goobye All!"
  end
end
describe ArticlesController do

  let(:article) { articles :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates article" do
    assert_difference('Article.count') do
      post :create, article: { body: article.body, title: article.title }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  it "shows article" do
    get :show, id: article
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: article
    assert_response :success
  end

  it "updates article" do
    put :update, id: article, article: { body: article.body, title: article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  it "destroys article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: article
    end

    assert_redirected_to articles_path
  end

end
=end
