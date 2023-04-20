require "episode_helper"

class Api::V1::SearchController < ApplicationController
  SUPPORTED_SEARCH_FIELDS = [
    "name"
  ]
  
  def search
    begin
      name = params.require(:name).strip
    rescue ActionController::ParameterMissing => e
      error = {
        error: "Must include name query paramter to search."
      }
      render json: error, status: 400
      return
    end
    
    characters = Rickmorty::Character.new
    results = characters.search(name)

    results.each do |character|
      character["seasons_appearing"] = EpisodeHelper::get_appearance_per_season(character)
    end    
    
    render json: results
  end
end
