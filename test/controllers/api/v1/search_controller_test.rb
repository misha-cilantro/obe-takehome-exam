require "test_helper"

class Api::V1::SearchControllerTest < ActionDispatch::IntegrationTest
  test "searching for rick returns character entries" do
    get api_v1_character_path({"name": "rick"})
    assert_response :success

    results = JSON.parse(response.body)
    assert results.length > 0, "should have entries"
    
    rick = results.first
    assert rick["name"], "Rick Sanchez"
    
    assert_not_nil rick["seasons_appearing"]
    assert_equal rick["seasons_appearing"], {
      "1" => 11,
      "2" => 10,
      "3" => 10,
      "4" => 10,
      "5" => 10
    }
  end

  test "error if name is missing" do
    get api_v1_character_path
    assert_response :bad_request
  end
end
