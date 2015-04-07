require 'test_helper'

class InsuranceLeadsControllerTest < ActionController::TestCase
  setup do
    @insurance_lead = insurance_leads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_leads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_lead" do
    assert_difference('InsuranceLead.count') do
      post :create, insurance_lead: { email: @insurance_lead.email, first_name: @insurance_lead.first_name, insurance_type: @insurance_lead.insurance_type, last_name_f: @insurance_lead.last_name_f, last_name_m: @insurance_lead.last_name_m, phone_number: @insurance_lead.phone_number }
    end

    assert_redirected_to insurance_lead_path(assigns(:insurance_lead))
  end

  test "should show insurance_lead" do
    get :show, id: @insurance_lead
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_lead
    assert_response :success
  end

  test "should update insurance_lead" do
    patch :update, id: @insurance_lead, insurance_lead: { email: @insurance_lead.email, first_name: @insurance_lead.first_name, insurance_type: @insurance_lead.insurance_type, last_name_f: @insurance_lead.last_name_f, last_name_m: @insurance_lead.last_name_m, phone_number: @insurance_lead.phone_number }
    assert_redirected_to insurance_lead_path(assigns(:insurance_lead))
  end

  test "should destroy insurance_lead" do
    assert_difference('InsuranceLead.count', -1) do
      delete :destroy, id: @insurance_lead
    end

    assert_redirected_to insurance_leads_path
  end
end
