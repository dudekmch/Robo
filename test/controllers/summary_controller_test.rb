require 'test_helper'

class SummaryControllerTest < ActionDispatch::IntegrationTest
  test "should get show_summary" do
    get summary_show_summary_url
    assert_response :success
  end

end
