require 'test_helper'

class AssignmentControllerTest < ActionDispatch::IntegrationTest
  test "should get assign" do
    get assignment_assign_url
    assert_response :success
  end

end
