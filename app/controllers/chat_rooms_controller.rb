class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: %i[show]

  def show
    @movie = Movie.find(params[:id])
    @chat_room = @movie.chat_room
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end
end
