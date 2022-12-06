class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  def home
  end

  def profile
    @user = User.find(params[:id])
    @followed_movies = @user.followed_movies.includes(:movie)
    @movies = []
    @followed_movies.each do |followed_movie|
      @movies << followed_movie.movie
    end
    @followed_users = FollowedUser.where(follower_id: @user.id)
  end
end
