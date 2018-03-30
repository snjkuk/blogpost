class CommentsController < ApplicationController

	def create
	  @comment = Comment.new(comment_params)
	  if @comment.save
	    flash[:success] = 'Your comment was successfully created!'
	    redirect_to posts_url
	  else
	    flash[:success] = 'Your comment was not created!'
	    redirect_to posts_url
	  end
	end

	private

	  def comment_params
	    params.require(:comment).permit(:user_id, :post_id, :comment, :parent_id)
	  end

end