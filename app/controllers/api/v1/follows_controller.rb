class Api::V1::FollowsController < ApplicationController
  def follow_movie
    movie = follow_params[:movie]
    user = follow_params[:user]
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

  private

  def follow_params
    params.require(:follow).permit(:user, :movie)
  end
end
