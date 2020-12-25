class PostsController < ApplicationController
  before_action :set_post_info,if: :use_before_action?

  def create
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    #サブクラスごとのオブジェクトを初期化
    post = self.class.const_get(const_name)
    @post = post.new(post_params)
    if @post.save
      redirect_to posts_path
    end
  end
  
  def index
    if use_before_action?
      const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
      #サブクラスごとのオブジェクトを初期化
      post = self.class.const_get(const_name)
      @post = post.new
      @posts = Post.where(type: const_name)
    else
      posts = Post.includes(:user)
      @post_book = posts.select{|x| x[:type].include?("Book")} 
      @post_clothes = posts.select{|x| x[:type].include?("Clothe")} 
    end
  end

  private

    def post_params
      params.require(@post_name).permit(:body).merge(user_id: current_user.id)
    end

    def use_before_action?
      false
    end

end
