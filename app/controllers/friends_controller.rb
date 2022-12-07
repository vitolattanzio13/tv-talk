class FriendsController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def show
  end
end
