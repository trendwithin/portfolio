require "test_helper"

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
