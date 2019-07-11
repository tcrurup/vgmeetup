class GenresController < ApplicationController

  #-----Create-----


  #-----Read-----
  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end
