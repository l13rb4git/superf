class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  private

    def find_post
      @post = Post.find_by(id: params[:id])
    end
end
