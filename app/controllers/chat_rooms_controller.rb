class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: %i[show]

  def show
    @movie = Movie.includes(:chat_room).find(params[:id])
    @chat_room = @movie.chat_room
    @posts = @chat_room.posts
    @post_votes = PostVote.all.includes(:users)
    @post = Post.new
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end
end
