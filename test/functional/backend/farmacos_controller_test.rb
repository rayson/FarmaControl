require 'test_helper'
 
class Backend::FarmacosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:farmacos)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create farmaco" do
    assert_difference('Farmaco.count') do
      post :create, :farmaco => { }
    end
 
    assert_redirected_to farmaco_path(assigns(:farmaco))
  end
 
  test "should show farmaco" do
    get :show, :id => farmacos(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => farmacos(:one).id
    assert_response :success
  end
 
  test "should update farmaco" do
    put :update, :id => farmacos(:one).id, :farmaco => { }
    assert_redirected_to farmaco_path(assigns(:farmaco))
  end
 
  test "should destroy farmaco" do
    assert_difference('Farmaco.count', -1) do
      delete :destroy, :id => farmacos(:one).id
    end
 
    assert_redirected_to farmacos_path
  end
end