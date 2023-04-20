class EpisodeHelper   
  def self.get_appearance_per_season(character)
    episode_nums = character["episode"].map do |ep|
      ep.split("/").last.to_i
    end

    seasons = {}
    episode_nums.each do |ep|
      if ep < 2
        season = 1
      else
        # offset due to 11 episode first seasons and episode count starting at 1
        season = (ep - 2) / 10 + 1
      end      
        
      unless seasons.has_key?(season)
        seasons[season] = 0
      end
      
      seasons[season] += 1
    end

    seasons
  end
end