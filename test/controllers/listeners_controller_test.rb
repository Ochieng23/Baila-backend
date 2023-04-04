require "test_helper"

class ListenersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listener = listeners(:one)
  end

  test "should get index" do
    get listeners_url, as: :json
    assert_response :success
  end

  test "should create listener" do
    assert_difference("Listener.count") do
      post listeners_url, params: { listener: { email: @listener.email, password: @listener.password, username: @listener.username } }, as: :json
    end

    assert_response :created
  end

  test "should show listener" do
    get listener_url(@listener), as: :json
    assert_response :success
  end

  test "should update listener" do
    patch listener_url(@listener), params: { listener: { email: @listener.email, password: @listener.password, username: @listener.username } }, as: :json
    assert_response :success
  end

  test "should destroy listener" do
    assert_difference("Listener.count", -1) do
      delete listener_url(@listener), as: :json
    end

    assert_response :no_content
  end
end
