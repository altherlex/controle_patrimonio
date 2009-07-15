require 'test_helper'

class PatrimoniosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patrimonios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patrimonio" do
    assert_difference('Patrimonio.count') do
      post :create, :patrimonio => { }
    end

    assert_redirected_to patrimonio_path(assigns(:patrimonio))
  end

  test "should show patrimonio" do
    get :show, :id => patrimonios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => patrimonios(:one).to_param
    assert_response :success
  end

  test "should update patrimonio" do
    put :update, :id => patrimonios(:one).to_param, :patrimonio => { }
    assert_redirected_to patrimonio_path(assigns(:patrimonio))
  end

  test "should destroy patrimonio" do
    assert_difference('Patrimonio.count', -1) do
      delete :destroy, :id => patrimonios(:one).to_param
    end

    assert_redirected_to patrimonios_path
  end
end
