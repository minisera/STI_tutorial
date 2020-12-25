class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_path
    end   
  end

  def destroy
    comment = Comment.find(post_id: params[:post_id], user_id: current_user.id)
    comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    pramas.require(:comment).permit(:body).merge(user_id: current_user.id,post_id: params[:post_id])
  end
end
