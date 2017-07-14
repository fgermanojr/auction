require 'test_helper'

class AuctionNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auction_news = auction_news(:one)
  end

  test "should get index" do
    get auction_news_url
    assert_response :success
  end

  test "should get new" do
    get new_auction_news_url
    assert_response :success
  end

  test "should create auction_news" do
    assert_difference('AuctionNew.count') do
      post auction_news_url, params: { auction_news: {  } }
    end

    assert_redirected_to auction_news_url(AuctionNew.last)
  end

  test "should show auction_news" do
    get auction_news_url(@auction_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_auction_news_url(@auction_news)
    assert_response :success
  end

  test "should update auction_news" do
    patch auction_news_url(@auction_news), params: { auction_news: {  } }
    assert_redirected_to auction_news_url(@auction_news)
  end

  test "should destroy auction_news" do
    assert_difference('AuctionNew.count', -1) do
      delete auction_news_url(@auction_news)
    end

    assert_redirected_to auction_news_url
  end
end
