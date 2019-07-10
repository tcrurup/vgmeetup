class PostController < ApplicationController

  get "/posts/new/:slug" do
    @recipient = User.find_by_slug(params[:slug])
    erb "post/new"
  end

end
