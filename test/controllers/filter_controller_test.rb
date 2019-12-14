require 'test_helper'

class FilterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get filter_index_url
    assert_response :success
  end

end
