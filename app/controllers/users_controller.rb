class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
<<<<<<< HEAD
    @user = User.find(params[:id])
    @posts = User.find_most_recent_post(@user)
=======
    # puts params
    @user = User.find(params[:id])
    @posts = @user.recent_posts
>>>>>>> 9806e8ececf4a1407ab7d16abda977d4b8f6dfe4
  end
end
