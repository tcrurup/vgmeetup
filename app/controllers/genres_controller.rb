class GenresController < ApplicationController

  #-----Create-----
  #Genres are created through the games/new view

  #-----Read-----
  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  #-----Update-----
  #Don't want to update.  Genre should be deleted entirely and new one created
  #in it's place
end
