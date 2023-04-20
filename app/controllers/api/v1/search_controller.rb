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
      results = characters.search(name) || []
  
      unless results.nil?
        results.each do |character|
          character["seasons_appearing"] = EpisodeHelper::get_appearance_per_season(character)
        end        
      end
      
      return results
    end
    
    render json: results
  end
end
