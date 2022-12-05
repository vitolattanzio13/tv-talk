class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = Post.find(params[:post_id])
    post_owner = @reply.post.user
    count = 0
    post_owner.posts.each do |post|
      count += post.replies.where(read: false).count
    end
    if @reply.save
      @notification = Notification.find_by(user_id: post_owner.id)
      NotificationChannel.broadcast_to(@notification, count)
      redirect_to post_path(@reply.post)
    else
      render :new, alert: "Reply could not be created"
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :photo)
  end
end
