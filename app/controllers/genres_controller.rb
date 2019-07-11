class GenresController < ApplicationController

  #-----Create-----
  #Genres are created through the games/new view

  #-----Read-----
  get '/genres' do
    ensure_logged_in
    erb :'genres/index'
  end

  get '/genres/:slug' do
    ensure_logged_in
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  #-----Update-----
  #Don't want to update.  Genre should be deleted entirely and new one created
  #in it's place

  #-----Delete-----

  get '/genres/:slug/delete' do
    ensure_logged_in
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/delete'
  end

  delete '/genres/:slug' do
    genre = Genre.find_by_slug(params[:slug])
    genre_name = genre.name
    genre.destroy

    flash_and_redirect("The #{genre_name} tag has been deleted", "/genres")
  end
end
