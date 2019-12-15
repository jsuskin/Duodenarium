class ExternalLinksListsController < ApplicationController
  def create
    list = ExternalLinksList.create(external_links_list_params)
    if list.valid?
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: 422
    end
  end

  def update
    @external_links_list = ExternalLinksList.find(params[:id])
    @external_links_list.update(external_links_list_params)
    if @external_links_list.save
      render json: @external_links_list
    else
      render json: { errors: external_links_list.errors.full_messages }, status: 422
    end
  end

  private

  def external_links_list_params
    params.require(:external_links_list).permit(:song_id, :discogs, :soundcloud, :bandcamp)
  end
end
