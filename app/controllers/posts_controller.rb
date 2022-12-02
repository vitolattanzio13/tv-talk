class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @replies = @post.replies
    @reply = Reply.new
  end

  def new
    @post = Post.new
    @chat_room = ChatRoom.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @chat_room = ChatRoom.find(params[:id])
    @post.chat_room_id = @chat_room.id
    # raise
    if @post.save
      # redirect_to posts_path
      redirect_back(fallback_location: root_path)
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
    params.require(:post).permit(:content, :photo)
  end
end
