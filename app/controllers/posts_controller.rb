class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  private
    
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def find_post
      @post = Post.find_by(params[:id])
    end
end
