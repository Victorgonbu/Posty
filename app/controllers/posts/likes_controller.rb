class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  def create
    if current_user
    @post.likes.where(user_id: current_user.id).first_or_create
    respond_to do |format|
      format.html {redirect_to @post}
      format.js 
    end
    else 
      redirect_to :new_user_session
    end
  end

  def destroy
    @post.likes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html {redirect_to @post}
      format.js 
    end
  end

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
