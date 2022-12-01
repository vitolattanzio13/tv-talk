class MoviesController < ApplicationController
  def index
    if params[:mquery].present?
      sql_mquery = "title ILIKE :mquery OR year ILIKE :mquery"
      @movies = Movie.where(sql_mquery, mquery: "%#{params[:mquery]}%")
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
