class FriendsController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
    @friends = []
    @friends = User.all - [current_user]
    # @friends[0] = User.all.second
    # @friends[1] = User.all.third
    # @friends[2] = User.all.fourth
  end

  def show
  end
end
