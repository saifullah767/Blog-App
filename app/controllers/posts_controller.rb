class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
<<<<<<< HEAD
    @posts = @user.posts.includes(:author).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
    @comments = @post.comments.order(created_at: :desc)
=======
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = User.find(params[:user_id]).posts.find(params[:id])
    @comments = @post.recent_comments
>>>>>>> 9806e8ececf4a1407ab7d16abda977d4b8f6dfe4
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Post not created!'
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id, :comments_counter, :likes_counter)
  end
end
