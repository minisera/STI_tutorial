class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render "posts/show"
    end
  end

  def destroy
    comment = Comment.find(post_id: params[:post_id], user_id: current_user.id)
    comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.permit(:body).merge(user_id: current_user.id,post_id: params[:post_id])
  end
end
