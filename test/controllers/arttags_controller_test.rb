require 'test_helper'

class ArttagsControllerTest < ActionController::TestCase
  setup do
    @arttag = arttags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arttags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arttag" do
    assert_difference('Arttag.count') do
      post :create, arttag: { tagname: @arttag.tagname }
    end

    assert_redirected_to arttag_path(assigns(:arttag))
  end

  test "should show arttag" do
    get :show, id: @arttag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arttag
    assert_response :success
  end

  test "should update arttag" do
    patch :update, id: @arttag, arttag: { tagname: @arttag.tagname }
    assert_redirected_to arttag_path(assigns(:arttag))
  end

  test "should destroy arttag" do
    assert_difference('Arttag.count', -1) do
      delete :destroy, id: @arttag
    end

    assert_redirected_to arttags_path
  end
end
