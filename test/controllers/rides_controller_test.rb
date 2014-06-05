require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { agreement_id: @ride.agreement_id, cost: @ride.cost, destination: @ride.destination, notes: @ride.notes, origin: @ride.origin, seats: @ride.seats, user_id: @ride.user_id, when: @ride.when }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride
    assert_response :success
  end

  test "should update ride" do
    patch :update, id: @ride, ride: { agreement_id: @ride.agreement_id, cost: @ride.cost, destination: @ride.destination, notes: @ride.notes, origin: @ride.origin, seats: @ride.seats, user_id: @ride.user_id, when: @ride.when }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end
