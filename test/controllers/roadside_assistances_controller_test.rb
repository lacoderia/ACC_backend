require 'test_helper'

class RoadsideAssistancesControllerTest < ActionController::TestCase
  setup do
    @roadside_assistance = roadside_assistances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roadside_assistances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roadside_assistance" do
    assert_difference('RoadsideAssistance.count') do
      post :create, roadside_assistance: { assistance_type: @roadside_assistance.assistance_type, is_guest: @roadside_assistance.is_guest, lat: @roadside_assistance.lat, long: @roadside_assistance.long, name: @roadside_assistance.name, phone_number: @roadside_assistance.phone_number, plate_number: @roadside_assistance.plate_number, user_id: @roadside_assistance.user_id }
    end

    assert_redirected_to roadside_assistance_path(assigns(:roadside_assistance))
  end

  test "should show roadside_assistance" do
    get :show, id: @roadside_assistance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roadside_assistance
    assert_response :success
  end

  test "should update roadside_assistance" do
    patch :update, id: @roadside_assistance, roadside_assistance: { assistance_type: @roadside_assistance.assistance_type, is_guest: @roadside_assistance.is_guest, lat: @roadside_assistance.lat, long: @roadside_assistance.long, name: @roadside_assistance.name, phone_number: @roadside_assistance.phone_number, plate_number: @roadside_assistance.plate_number, user_id: @roadside_assistance.user_id }
    assert_redirected_to roadside_assistance_path(assigns(:roadside_assistance))
  end

  test "should destroy roadside_assistance" do
    assert_difference('RoadsideAssistance.count', -1) do
      delete :destroy, id: @roadside_assistance
    end

    assert_redirected_to roadside_assistances_path
  end
end
