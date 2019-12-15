class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs.to_json( :only => [:id, :title, :url, :image, :created_at], :include => [{ :artist => { :only => :name } }, { :tags => { :only => :name } }, { :external_links_list => { :only => [:discogs, :bandcamp, :soundcloud] } }] )
  end

  def show
    song = Song.find(params[:id])
    render json: song.to_json( :only => [:id, :title, :url, :image, :created_at], :include => [{ :artist => { :only => :name } }, { :tags => { :only => :name } }] )
  end

  def create
    song = Song.create(song_params)
    if song.valid?
      render json: song
    else
      render json: { errors: song.errors.full_messages }, status: 422
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.save
      render json: @song
    else
      render json: { errors: song.errors.full_messages }, status: 422
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :url, :image, :artist_id)
  end
end
