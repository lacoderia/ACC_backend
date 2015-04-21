require 'test_helper'

class InsurancePricesControllerTest < ActionController::TestCase
  setup do
    @insurance_price = insurance_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_price" do
    assert_difference('InsurancePrice.count') do
      post :create, insurance_price: { ageold: @insurance_price.ageold, price: @insurance_price.price, size: @insurance_price.size, vehicle_type: @insurance_price.vehicle_type }
    end

    assert_redirected_to insurance_price_path(assigns(:insurance_price))
  end

  test "should show insurance_price" do
    get :show, id: @insurance_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_price
    assert_response :success
  end

  test "should update insurance_price" do
    patch :update, id: @insurance_price, insurance_price: { ageold: @insurance_price.ageold, price: @insurance_price.price, size: @insurance_price.size, vehicle_type: @insurance_price.vehicle_type }
    assert_redirected_to insurance_price_path(assigns(:insurance_price))
  end

  test "should destroy insurance_price" do
    assert_difference('InsurancePrice.count', -1) do
      delete :destroy, id: @insurance_price
    end

    assert_redirected_to insurance_prices_path
  end
end
