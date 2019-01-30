class CommentsController < ApplicationController
	def create
		@board = Board.find(params[:board_id])
		comment = @board.comments.create(comment_params)
		redirect_to board_path(@board)
	end

	private
	  def comment_params
			params.require(:comment).permit(:username, :body)
    end
end
