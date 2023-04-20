class Api::V1::SearchController < ApplicationController
  def search
    render json: {
      ok: "ok"
    }
  end
end
