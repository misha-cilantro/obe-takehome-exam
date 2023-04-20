class Api::V1::SearchController < ApplicationController
  def search
    name = params[:name]
    
    characters = Rickmorty::Character.new
    render json: characters.search(name)
  end
end
