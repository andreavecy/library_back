require "test_helper"

class FavoriteBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_book = favorite_books(:one)
  end

  test "should get index" do
    get favorite_books_url, as: :json
    assert_response :success
  end

  test "should create favorite_book" do
    assert_difference("FavoriteBook.count") do
      post favorite_books_url, params: { favorite_book: { book_id: @favorite_book.book_id, user_id: @favorite_book.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show favorite_book" do
    get favorite_book_url(@favorite_book), as: :json
    assert_response :success
  end

  test "should update favorite_book" do
    patch favorite_book_url(@favorite_book), params: { favorite_book: { book_id: @favorite_book.book_id, user_id: @favorite_book.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy favorite_book" do
    assert_difference("FavoriteBook.count", -1) do
      delete favorite_book_url(@favorite_book), as: :json
    end

    assert_response :no_content
  end
end
