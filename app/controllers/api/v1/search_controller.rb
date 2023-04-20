require "episode_helper"

class Api::V1::SearchController < ApplicationController  
  def search
    begin
      # strip and downcase for consistency when caching
      name = params.require(:name).strip.downcase
    rescue ActionController::ParameterMissing => e
      error = {
        error: "Must include name query paramter to search."
      }
      render json: error, status: 400
      return
    end
    
    results = Rails.cache.fetch(name) do 
      characters = Rickmorty::Character.new
      search_result = characters.search(name) || []
  
      unless search_result.nil?
        search_result.each do |character|
          character["seasons_appearing"] = EpisodeHelper::get_appearance_per_season(character)
        end        
      end
      
      search_result
    end
    
    render json: results
  end
end
