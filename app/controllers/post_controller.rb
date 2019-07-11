class PostController < ApplicationController

  #-----Create-----

  get "/posts/new/:user_slug" do
    @recipient = User.find_by_slug(params[:user_slug])
    if current_user.is_friends_with?(@recipient)
      erb :"post/new"
    else
      flash[:message] = "You must be friends to post on #{@recipient.username}'s board"
      redirect "/user/#{@recipient.slug}"
    end
  end

  post "/posts/:user_slug" do
    recipient = User.find_by_slug(params[:user_slug])
    current_user.post_to_other_users_board(params[:post_content], recipient)
    redirect "/user/#{recipient.slug}"
  end

  #-----Edit-----

  get "/posts/:slug/edit" do
    @post = Post.find_by_slug(params[:slug])
    erb :'post/edit'
  end

  patch "/posts/:slug" do
    post = Post.find_by_slug(params[:slug])
    post.update(params[:post])

    redirect
  end

end
