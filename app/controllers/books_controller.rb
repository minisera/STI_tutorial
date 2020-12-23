class BooksController < PostsController
  private
    def set_post_info
      @post_name = "book"
    end
end