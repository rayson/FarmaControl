require 'test_helper'
 
class Backend::TipoMovimentacaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_movimentacaos)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create tipo_movimentacao" do
    assert_difference('TipoMovimentacao.count') do
      post :create, :tipo_movimentacao => { }
    end
 
    assert_redirected_to tipo_movimentacao_path(assigns(:tipo_movimentacao))
  end
 
  test "should show tipo_movimentacao" do
    get :show, :id => tipo_movimentacaos(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => tipo_movimentacaos(:one).id
    assert_response :success
  end
 
  test "should update tipo_movimentacao" do
    put :update, :id => tipo_movimentacaos(:one).id, :tipo_movimentacao => { }
    assert_redirected_to tipo_movimentacao_path(assigns(:tipo_movimentacao))
  end
 
  test "should destroy tipo_movimentacao" do
    assert_difference('TipoMovimentacao.count', -1) do
      delete :destroy, :id => tipo_movimentacaos(:one).id
    end
 
    assert_redirected_to tipo_movimentacaos_path
  end
end