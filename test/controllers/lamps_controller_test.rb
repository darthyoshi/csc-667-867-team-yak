require 'test_helper'

class LampsControllerTest < ActionController::TestCase
  setup do
    @lamp = lamps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lamps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lamp" do
    assert_difference('Lamp.count') do
      post :create, lamp: { artwork_id: @lamp.artwork_id, review_date: @lamp.review_date, review_text: @lamp.review_text, stars: @lamp.stars, user_id: @lamp.user_id }
    end

    assert_redirected_to lamp_path(assigns(:lamp))
  end

  test "should show lamp" do
    get :show, id: @lamp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lamp
    assert_response :success
  end

  test "should update lamp" do
    patch :update, id: @lamp, lamp: { artwork_id: @lamp.artwork_id, review_date: @lamp.review_date, review_text: @lamp.review_text, stars: @lamp.stars, user_id: @lamp.user_id }
    assert_redirected_to lamp_path(assigns(:lamp))
  end

  test "should destroy lamp" do
    assert_difference('Lamp.count', -1) do
      delete :destroy, id: @lamp
    end

    assert_redirected_to lamps_path
  end
end
