require 'test_helper'

class SearchappsControllerTest < ActionController::TestCase
  setup do
    @searchapp = searchapps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searchapps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searchapp" do
    assert_difference('Searchapp.count') do
      post :create, searchapp: { content: @searchapp.content, file_name: @searchapp.file_name }
    end

    assert_redirected_to searchapp_path(assigns(:searchapp))
  end

  test "should show searchapp" do
    get :show, id: @searchapp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searchapp
    assert_response :success
  end

  test "should update searchapp" do
    put :update, id: @searchapp, searchapp: { content: @searchapp.content, file_name: @searchapp.file_name }
    assert_redirected_to searchapp_path(assigns(:searchapp))
  end

  test "should destroy searchapp" do
    assert_difference('Searchapp.count', -1) do
      delete :destroy, id: @searchapp
    end

    assert_redirected_to searchapps_path
  end
end
