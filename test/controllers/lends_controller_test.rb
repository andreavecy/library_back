require "test_helper"

class LendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lend = lends(:one)
  end

  test "should get index" do
    get lends_url, as: :json
    assert_response :success
  end

  test "should create lend" do
    assert_difference("Lend.count") do
      post lends_url, params: { lend: { book_id: @lend.book_id, lend_date: @lend.lend_date, user_id: @lend.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show lend" do
    get lend_url(@lend), as: :json
    assert_response :success
  end

  test "should update lend" do
    patch lend_url(@lend), params: { lend: { book_id: @lend.book_id, lend_date: @lend.lend_date, user_id: @lend.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy lend" do
    assert_difference("Lend.count", -1) do
      delete lend_url(@lend), as: :json
    end

    assert_response :no_content
  end
end
