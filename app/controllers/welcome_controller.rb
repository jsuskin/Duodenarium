class WelcomeController < ApplicationController
  def index
    songs = Song.all
    render json: songs.to_json( :only => [:id, :title, :url, :image, :created_at], :include => [{ :artist => { :only => :name } }, { :tags => { :only => :name } }, { :external_links_list => { :only => [:discogs, :bandcamp, :soundcloud] } }] )
  end
end
