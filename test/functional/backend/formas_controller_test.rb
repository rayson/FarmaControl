require 'test_helper'
 
class Backend::FormasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formas)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create forma" do
    assert_difference('Forma.count') do
      post :create, :forma => { }
    end
 
    assert_redirected_to forma_path(assigns(:forma))
  end
 
  test "should show forma" do
    get :show, :id => formas(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => formas(:one).id
    assert_response :success
  end
 
  test "should update forma" do
    put :update, :id => formas(:one).id, :forma => { }
    assert_redirected_to forma_path(assigns(:forma))
  end
 
  test "should destroy forma" do
    assert_difference('Forma.count', -1) do
      delete :destroy, :id => formas(:one).id
    end
 
    assert_redirected_to formas_path
  end
end