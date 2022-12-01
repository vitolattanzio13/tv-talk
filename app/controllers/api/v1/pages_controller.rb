class Api::V1::PagesController < ApplicationController
  def search_query
    query = params[:query]
    movies = Movie.where("title ILIKE ?", "%#{query}%")
    users = User.where("nickname ILIKE ?", "%#{query}%")
    results = movies + users
    results = results.first(5) if results.size > 5
    json = format_response(results)
    respond_to do |format|
      format.json { render json: json.to_json }
    end
  end

  private

  def format_response(results)
    results.map do |result|
      if result.instance_of?(Movie)
        { title: result.title, url: result.id, type: "movie" }
      elsif result.instance_of?(User)
        { title: result.nickname, url: "", type: "user" }
      end
    end
  end
end
