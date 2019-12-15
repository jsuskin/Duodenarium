class TagsController < ApplicationController
  def create
    tag = Tag.create(tag_params)
    if tag.valid?
      render json: tag
    else
      render json: { errors: song.errors.full_messages }, status: 422
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :song_id)
  end
end
