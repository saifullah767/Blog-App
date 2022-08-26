class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find_most_recent_post(@user)
    # puts params
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
