class FriendsController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
    @friends = []
    @friends = User.all - [current_user]
  end

  def show
  end
end
