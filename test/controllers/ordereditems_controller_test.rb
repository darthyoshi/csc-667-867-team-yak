require 'test_helper'

class OrdereditemsControllerTest < ActionController::TestCase
  setup do
    @ordereditem = ordereditems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordereditems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordereditem" do
    assert_difference('Ordereditem.count') do
      post :create, ordereditem: { category: @ordereditem.category, description: @ordereditem.description, imagepath: @ordereditem.imagepath, order_id: @ordereditem.order_id, price: @ordereditem.price, quantity: @ordereditem.quantity, seller_email: @ordereditem.seller_email, seller_name: @ordereditem.seller_name, sold_artwork_id: @ordereditem.sold_artwork_id, title: @ordereditem.title }
    end

    assert_redirected_to ordereditem_path(assigns(:ordereditem))
  end

  test "should show ordereditem" do
    get :show, id: @ordereditem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordereditem
    assert_response :success
  end

  test "should update ordereditem" do
    patch :update, id: @ordereditem, ordereditem: { category: @ordereditem.category, description: @ordereditem.description, imagepath: @ordereditem.imagepath, order_id: @ordereditem.order_id, price: @ordereditem.price, quantity: @ordereditem.quantity, seller_email: @ordereditem.seller_email, seller_name: @ordereditem.seller_name, sold_artwork_id: @ordereditem.sold_artwork_id, title: @ordereditem.title }
    assert_redirected_to ordereditem_path(assigns(:ordereditem))
  end

  test "should destroy ordereditem" do
    assert_difference('Ordereditem.count', -1) do
      delete :destroy, id: @ordereditem
    end

    assert_redirected_to ordereditems_path
  end
end
