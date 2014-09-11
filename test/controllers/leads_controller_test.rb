require 'test_helper'

class LeadsControllerTest < ActionController::TestCase
  setup do
    @lead = leads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead" do
    assert_difference('Lead.count') do
      post :create, lead: { document_id: @lead.document_id, document_type: @lead.document_type, email: @lead.email, first_name: @lead.first_name, last_name_f: @lead.last_name_f, last_name_m: @lead.last_name_m, phone_number: @lead.phone_number, plate_number: @lead.plate_number }
    end

    assert_redirected_to lead_path(assigns(:lead))
  end

  test "should show lead" do
    get :show, id: @lead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead
    assert_response :success
  end

  test "should update lead" do
    patch :update, id: @lead, lead: { document_id: @lead.document_id, document_type: @lead.document_type, email: @lead.email, first_name: @lead.first_name, last_name_f: @lead.last_name_f, last_name_m: @lead.last_name_m, phone_number: @lead.phone_number, plate_number: @lead.plate_number }
    assert_redirected_to lead_path(assigns(:lead))
  end

  test "should destroy lead" do
    assert_difference('Lead.count', -1) do
      delete :destroy, id: @lead
    end

    assert_redirected_to leads_path
  end
end
