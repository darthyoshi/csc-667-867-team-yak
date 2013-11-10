require 'test_helper'

class ShoppingcartitemsControllerTest < ActionController::TestCase
  setup do
    @shoppingcartitem = shoppingcartitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoppingcartitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shoppingcartitem" do
    assert_difference('Shoppingcartitem.count') do
      post :create, shoppingcartitem: { artwork_id: @shoppingcartitem.artwork_id, quantity: @shoppingcartitem.quantity, user_id: @shoppingcartitem.user_id }
    end

    assert_redirected_to shoppingcartitem_path(assigns(:shoppingcartitem))
  end

  test "should show shoppingcartitem" do
    get :show, id: @shoppingcartitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shoppingcartitem
    assert_response :success
  end

  test "should update shoppingcartitem" do
    patch :update, id: @shoppingcartitem, shoppingcartitem: { artwork_id: @shoppingcartitem.artwork_id, quantity: @shoppingcartitem.quantity, user_id: @shoppingcartitem.user_id }
    assert_redirected_to shoppingcartitem_path(assigns(:shoppingcartitem))
  end

  test "should destroy shoppingcartitem" do
    assert_difference('Shoppingcartitem.count', -1) do
      delete :destroy, id: @shoppingcartitem
    end

    assert_redirected_to shoppingcartitems_path
  end
end
