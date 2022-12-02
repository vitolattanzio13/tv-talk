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

  def like
    post = like_params[:post]
    user = like_params[:user]
    action = {}
    post_instance = Post.find(post)
    all_user_post_votes = PostVote.where(user_id: user)

    if all_user_post_votes.empty? || all_user_post_votes.where(post_id: post).empty?
      register = PostVote.new(user_id: user, post_id: post)
      post_instance.likes += 1
      post_instance.save
      action[:status] = register.save
    else
      register = PostVote.find_by(post_id: post)
      post_instance.likes -= 1
      post_instance.save
      action[:status] = register.destroy
    end
    action[:new_count] = post_instance.likes
    respond_to do |format|
      format.json { render json: action.to_json }
    end
  end

  private

  def like_params
    params.require(:like).permit(:user, :poster, :post)
  end

  def format_response(results)
    results.map do |result|
      if result.instance_of?(Movie)
        { title: result.title, url: result.id, chat: result.chat_room.id, type: "movie" }
      elsif result.instance_of?(User)
        { title: result.nickname, url: "", type: "user" }
      end
    end
  end
end
