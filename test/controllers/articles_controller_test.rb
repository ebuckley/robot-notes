require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_user
    # TODO get fixture
    @article = articles(:one)
  end
  test "I can create an article" do
    get new_article_url
    assert_response :success
    
    new_article = { article: { title: "can create", text: "article created successfully." } }
    
    post articles_url, params: new_article
    follow_redirect!
  
    assert_response :success

    created_article = Article.find_by(title: 'can create')

    assert_not_nil created_article
    assert_not_nil created_article.owner_id
  end
  test "I can show an article" do
    get article_url(@article)
    assert_response :success
  end

  test "I can update an article" do
  
    get edit_article_url(@article)
    assert_response :success

    new_update_content = 'NEW CONTENT YO'
    updated_content = {article: {text: new_update_content}}
    put article_url(@article), params: updated_content
    follow_redirect!
    assert_response :success

    update_article = Article.find_by(text: new_update_content)
    assert_not_nil update_article
  end
end
