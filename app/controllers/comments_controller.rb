class CommentsController < ApplicationController

  def new
    @comments = Comment.new
		respond_to do |format|
			format.html
			format.js
		end
	end

  def create
		@comment = current_user.comments.new(work_params)
    @comment.save
  end


  private

    def work_params
      params.require(:comment).permit(:desc)
    end
end
