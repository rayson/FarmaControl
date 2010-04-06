require 'test_helper'
 
class Backend::EstoquesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estoques)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create estoque" do
    assert_difference('Estoque.count') do
      post :create, :estoque => { }
    end
 
    assert_redirected_to estoque_path(assigns(:estoque))
  end
 
  test "should show estoque" do
    get :show, :id => estoques(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => estoques(:one).id
    assert_response :success
  end
 
  test "should update estoque" do
    put :update, :id => estoques(:one).id, :estoque => { }
    assert_redirected_to estoque_path(assigns(:estoque))
  end
 
  test "should destroy estoque" do
    assert_difference('Estoque.count', -1) do
      delete :destroy, :id => estoques(:one).id
    end
 
    assert_redirected_to estoques_path
  end
end