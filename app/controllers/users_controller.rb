class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @post_book = @user.posts.select{|x| x[:type].include?("Book")}
    @post_clothes = @user.posts.select{|x| x[:type].include?("Clothe")}
    # set_post_by_genre
  end

  private
    # def set_post_by_genre
    #   @post_list = Array.new
    #   GENRE.each do |post|
    #     key = "@#{post}"
    #     if @user.send(post).nil?    # 1
    #       post = post.gsub(/\b\w/) { |s| s.upcase }    # 2
    #       value = self.class.const_get(post).new    # 3
    #     else
    #       value = @user.send(post)    # 4
    #     end
    #     instance_variable_set(key, value)    # 5
    #     @post_list << instance_variable_get(key)    # 6
    #   end
    # end
end
