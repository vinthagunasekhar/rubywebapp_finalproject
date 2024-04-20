class MediaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

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
      MediaMailer.new_media_email(current_user, @medium).deliver_later
      redirect_to user_path(current_user), notice: 'Your media has been saved successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @medium.update(medium_params)
      redirect_to user_path(current_user), notice: 'Media was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @medium.destroy
    redirect_to user_path(current_user), notice: 'Media was successfully destroyed.'
  end

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:title, :description, :media_type, :ott, :image,:total_seasons, :seasons_watched)
  end
  def check_owner
    redirect_to root_path, alert: "Not authorized" if @medium.user != current_user
  end
end
