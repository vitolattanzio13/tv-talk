class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  def home
  end

  def search_query
    @query = params[:query]
    @movies = Movie.where("title ILIKE ?", "%#{@query}%")
    @users = User.where("nickname ILIKE ?", "%#{@query}%")
    results = @movies + @users
    results = results.first(5) if results.size > 5
    json = results.map do |result|
      if result.instance_of?(Movie)
        { title: result.title, url: result.id, type: "movie" }
      elsif result.instance_of?(User)
        { title: result.nickname, url: "", type: "user" }
      end
    end
    # test = { title: "test", url: "test" }
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: json.to_json }
    end
  end
end
