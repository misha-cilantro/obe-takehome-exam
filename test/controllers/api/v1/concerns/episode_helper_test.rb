require "test_helper"
require "episode_helper"

class Api::V1::EpisodeHelperTest < ActiveSupport::TestCase
  def make_character(eps)    
    {
      "episode" => eps.map { |ep| "some/address/#{ep}" }
    }
  end
  
  test "a character just in episode 1 has one appearance in season 1" do
    data = make_character([1])
    result = EpisodeHelper::get_appearance_per_season(data)
    assert_equal result, {1 => 1}, "seasons appearing should match"
  end

  test "a character appearing in the first and last episode of season 2 should show two appearances in season 2" do
    data = make_character([12, 21])
    result = EpisodeHelper::get_appearance_per_season(data)
    assert_equal result, {2 => 2}
  end

  test "a character appearing in the first and last episode of season 5 and 6 should show two appearances in each season" do
    data = make_character([42, 51, 52, 61])
    result = EpisodeHelper::get_appearance_per_season(data)
    assert_equal result, {5 => 2, 6 => 2}
  end
end