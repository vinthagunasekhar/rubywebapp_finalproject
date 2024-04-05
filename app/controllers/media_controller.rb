class MediaController < ApplicationController
  before_action :require_user, except: [:index, :show]

  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  def index
    @media = current_user.media
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = current_user.media.build(medium_params)
  if @medium.save
    flash[:notice] = 'Your media is saved successfully.' # This sets the flash message
    redirect_to media_path(@medium) # Adjust this if you want to redirect somewhere else
  else
    flash.now[:alert] = 'There was a problem saving your media.'
    render :new
  end
  end

  def edit
  end

  def update
    if @medium.update(medium_params)
      redirect_to @medium, notice: 'Media was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @medium.destroy
    redirect_to media_url, notice: 'Media was successfully destroyed.'
  end

  private
    def set_medium
      @medium = current_user.media.find(params[:id])
    end

    def medium_params
      params.require(:medium).permit(:title, :description, :media_type, :ott, :total_seasons, :seasons_watched)
    end
end
