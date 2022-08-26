class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = User.find(params[:user_id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
    # @user = current_user
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      flash.now[:error] = 'Comment not saved!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :author_id)
  end
end
