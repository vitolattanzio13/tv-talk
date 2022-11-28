class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @replies = @post.replies
    @reply = Reply.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.chat_room = ChatRoom.find(params[:chat_room_id])
    if @post.save
      redirect_to chat_room_path(@post.chat_room)
    else
      render :new, alert: "Post could not be created"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
