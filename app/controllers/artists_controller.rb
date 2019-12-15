class ArtistsController < ApplicationController
  def index
    artists = Artist.all
    render json: artists.to_json( :only => [:id, :name], :include => { :songs => { :only => [:id, :title, :url, :image, :created_at], :include => { :tags => { :only => :name } } } } )
  end

  def show
    @artist = Artist.find(params[:id])
    render json: @artist.to_json( :only => [:id, :name], :include => { :songs => { :only => [:id, :title, :url, :image, :created_at], :include => { :tags => { :only => :name } } } } )
  end

  def create
    artist = Artist.create(artist_params)
    if artist.valid?
      render json: artist
    else
      render json: { errors: artist.errors.full_messages }, status: 422
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
