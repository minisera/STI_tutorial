class BookController < PostsController
  private
    def set_post_info
      @post_name = "book"
    end
end