class PostController < ApplicationController

  #-----Create-----

  get "/posts/new/:slug" do
    @recipient = User.find_by_slug(params[:slug])
    erb :"post/new"
  end

  post "/posts/:slug" do
    recipient = User.find_by_slug(params[:slug])
    current_user.post_to_other_users_board(params[:post_content], recipient)
    redirect "/user/#{recipient.slug}"
  end

end
