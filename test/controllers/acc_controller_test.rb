require 'test_helper'

class AccControllerTest < ActionController::TestCase
  test "should get pico_placa" do
    get :pico_placa
    assert_response :success
  end

end
