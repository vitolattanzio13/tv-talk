class PagesController < ApplicationController
  # before_action :authenticate_user!

  def home
  end

  def profile
    @user = User.find(params[:id]) || User.all[0]
    @followed_movies = @user.followed_movies.includes(:movie)
    @movies = []
    @followed_movies.each do |followed_movie|
      @movies << followed_movie.movie
    end
    @followed_users = FollowedUser.where(follower_id: @user.id)
  end
end
