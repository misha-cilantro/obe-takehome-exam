class EpisodeHelper  
  # seasons 1 had 11 eps, all other seasons have had 10
  SEASON_ONE_END = 11
  
  def get_appearance_per_season(character)
    episode_nums = character["episode"].map do |ep|
      ep.split("/").last.to_i
    end

    seasons = {}
    episode_nums.each do |ep|
      
    end
  end
end