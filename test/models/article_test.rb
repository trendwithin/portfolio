require "test_helper"

describe Article do
  let(:article) { Article.new }

  it "must be valid" do
    article.must_be :valid?
  end
end
