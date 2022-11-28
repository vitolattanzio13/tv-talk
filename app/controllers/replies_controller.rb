class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = Post.find(params[:post_id])
    if @reply.save
      redirect_to post_path(@reply.post)
    else
      render :new, alert: "Reply could not be created"
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
