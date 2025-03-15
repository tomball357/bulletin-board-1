class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts # Ensure Board `has_many :posts`
    @post = Post.new # Needed for form
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end
