require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

end
