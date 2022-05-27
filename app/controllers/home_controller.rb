class HomeController < ApplicationController

  def index
    @posts = Post.all
    @posts_count = Post.all.count % 3 == 0 ? Post.all.count/3 : Post.all.count/3 + 1
  end

  def results
    unless params[:search] == ""
      @posts = Post.search(params[:search])
      @posts = Kaminari.paginate_array(@posts).page(params[:page])
    else
      @posts = Post.all.page(params[:page])
    end
  end
end
