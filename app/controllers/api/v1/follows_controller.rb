class Api::V1::FollowsController < ApplicationController
  def follow_movie
    movie = follow_movie_params[:movie]
    user = follow_movie_params[:user]
    action = {}
    is_following = FollowedMovie.where(user_id: user, movie_id: movie) || []
    if is_following.empty?
      follow = FollowedMovie.new(user_id: user, movie_id: movie)
      action[:job] = "follow"
      action[:status] = follow.save
    else
      follow = FollowedMovie.find_by(user_id: user, movie_id: movie)
      action[:job] = "unfollow"
      action[:status] = true if follow.destroy
    end
    respond_to do |format|
      format.json { render json: action.to_json }
    end
  end

  def follow_user
    user = follow_user_params[:user]
    followee = follow_user_params[:followee]
    action = {}
    is_following = FollowedUser.where(follower_id: user, followee_id: followee) || []
    if is_following.empty?
      follow = FollowedUser.new(follower_id: user, followee_id: followee)
      action[:job] = "follow"
      action[:status] = follow.save
      action[:followee] = follow_user_params
    else
      follow = FollowedUser.find_by(follower_id: user, followee_id: followee)
      action[:job] = "unfollow"
      action[:status] = true if follow.destroy
    end
    respond_to do |format|
      format.json { render json: action.to_json }
    end
  end

  private

  def follow_user_params
    params.require(:follow_user).permit(:user, :followee)
  end

  def follow_movie_params
    params.require(:follow_movie).permit(:user, :movie)
  end
end
