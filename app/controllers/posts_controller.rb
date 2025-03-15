class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to board_path(@post.board_id)
    else
      @board = Board.find(@post.board_id)
      @posts = @board.posts
      render "boards/show"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :expires_on, :board_id)
  end
end
