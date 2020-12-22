class PostsController < ApplicationController
  before_action :set_post_info
  before_action :post_params

  def create
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    # サブクラスごとのオブジェクトを初期化
    @post = self.class.const_get(const_name)
    @post.new(post_params)
    @post.save
  end

  private
    def post_params
      params.require(@post_name).permit(:user_id,:body)
    end
end
