require "test_helper"

class Api::V1::SearchControllerTest < ActionDispatch::IntegrationTest
  test "searching for rick returns character entries" do
    get api_v1_character_path({"name": "rick"})
    assert_response :success

    results = JSON.parse(response.body)
    assert results.length > 0, "should have entries"
  end

  test "error if name is missing" do
    get api_v1_character_path
    assert_response :bad_request    
  end
end
