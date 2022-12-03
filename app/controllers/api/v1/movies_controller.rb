class Api::V1::MoviesController < ApplicationController
  def search
    query = params[:query]
    movies = Movie.where("title ILIKE ?", "%#{query}%")
    results = movies.first(5) if movies.size > 5
    results.nil? ? json = "no results" : json = format_response(results)
    respond_to do |format|
      format.json { render json: json.to_json }
    end
  end

  private

  def format_response(results)
    results.map do |result|
      { title: result.title, url: result.id, chat: result.chat_room.id, type: "movie" }
    end
  end
end
