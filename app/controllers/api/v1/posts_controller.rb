class Api::V1::PostsController < ApplicationController
  def create
    content= post_params[:content]
    user= current_user
    title = post_params[:title]
    chat_room = Movie.find_by(title: title).chat_room
    @post = Post.new(content: content, user: user, chat_room: chat_room)
    @post.save
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :user)
  end

end
