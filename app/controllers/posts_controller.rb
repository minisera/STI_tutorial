class PostsController < ApplicationController
  before_action :set_post_info
  # before_action :post_params

  def create
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    #サブクラスごとのオブジェクトを初期化
    post = self.class.const_get(const_name)
    @post = post.new(post_params)
    if @post.save
      redirect_to user_path(current_user)
    end
  end

  private
    def post_params
      params.require(@post_name).permit(:body).merge(user_id: current_user.id)
    end
end
