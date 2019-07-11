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

  post "/posts/:slug" do
    recipient = User.find_by_slug(params[:slug])
    current_user.post_to_other_users_board(params[:post_content], recipient)
    redirect "/user/#{recipient.slug}"
  end

  #-----Edit-----

  get "/posts/" do

  end

end
