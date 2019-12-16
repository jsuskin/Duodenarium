class TagsController < ApplicationController
  def create
    tag = Tag.create(tag_params)
    if tag.valid?
      render json: tag
    else
      render json: { errors: song.errors.full_messages }, status: 422
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: { errors: tag.errors.full_messages }, status: 422
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :song_id)
  end
end
