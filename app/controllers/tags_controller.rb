class TagsController < ApplicationController
  before_action :set_tag, only: %i[show]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render :new
    end
  end

  def show
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :alternate_name, :image)
  end
end
