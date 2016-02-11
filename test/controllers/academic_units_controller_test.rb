require 'test_helper'

class AcademicUnitsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
