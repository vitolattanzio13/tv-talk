class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @posts = Post.all.order(updated_at: :desc)
    @post = Post.new
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
    @chat_room = ChatRoom.first
    @post.chat_room = @chat_room
    # line 22 and 23 its for testing
    # @post.chat_room = ChatRoom.find(params[:chat_room_id])
    if @post.save
      redirect_to posts_path
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
