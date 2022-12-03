class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: %i[show]

  def show
    @movie = @chat_room.movie
    @posts = @chat_room.posts.order(created_at: :desc)
    @post_votes = PostVote.all.includes(:users)
    @post = Post.new
    @post.chat_room = @chat_room
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.includes(:posts).find(params[:id])
  end
end
