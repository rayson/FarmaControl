require 'test_helper'
 
class Backend::MovimentacaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimentacaos)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create movimentacao" do
    assert_difference('Movimentacao.count') do
      post :create, :movimentacao => { }
    end
 
    assert_redirected_to movimentacao_path(assigns(:movimentacao))
  end
 
  test "should show movimentacao" do
    get :show, :id => movimentacaos(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => movimentacaos(:one).id
    assert_response :success
  end
 
  test "should update movimentacao" do
    put :update, :id => movimentacaos(:one).id, :movimentacao => { }
    assert_redirected_to movimentacao_path(assigns(:movimentacao))
  end
 
  test "should destroy movimentacao" do
    assert_difference('Movimentacao.count', -1) do
      delete :destroy, :id => movimentacaos(:one).id
    end
 
    assert_redirected_to movimentacaos_path
  end
end