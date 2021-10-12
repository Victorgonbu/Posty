class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html {redirect_to @commentable, notice: "Your comment was succeessfully posted." }
      format.js
    end

  end

  def show
    p @commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end