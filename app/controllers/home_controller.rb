class HomeController < ApplicationController

  def index
    @posts = Post.all
    @posts_count = Post.all.count % 3 == 0 ? Post.all.count/3 : Post.all.count/3 + 1
  end

end
