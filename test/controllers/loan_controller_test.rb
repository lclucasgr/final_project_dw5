require 'test_helper'

class LoanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loan_index_url
    assert_response :success
  end

end
