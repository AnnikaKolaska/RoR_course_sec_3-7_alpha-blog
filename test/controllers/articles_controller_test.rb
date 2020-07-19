require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end
  
  # test "should get index" do
  #   get articles_path
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_article_path
  #   assert_response :success
  # end

  # test "should create article" do
  #   assert_difference('Article.count') do
  #     post articles_path, params: { article: { title: 'new title', description: 'new description thats long enough' } }
  #   end
  #   assert_redirected_to article_path(Article.last)
  # end

  # test "should get show" do
  #   get article_path(@article)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_article_path(@article)
  #   assert_response :success
  # end

  # test "should update article" do
  #   patch article_path(@article), params: { article: { title: @article.title } }
  #   assert_redirected_to article_path(@article)
  # end

  # test "should get destroy" do
  #   assert_difference('Article.count', -1) do
  #     delete article_path(@article)
  #   end
  # end

end
