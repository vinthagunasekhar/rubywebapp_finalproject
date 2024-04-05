class EpisodesController < ApplicationController
  before_action :require_user
  before_action :set_medium
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @episode = @medium.episodes.build
  end

  def create
    @episode = @medium.episodes.build(episode_params)
    if @episode.save
      redirect_to [@medium, @episode], notice: 'Episode was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @episode.update(episode_params)
      redirect_to [@medium, @episode], notice: 'Episode was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @episode.destroy
    redirect_to medium_path(@medium), notice: 'Episode was successfully destroyed.'
  end

  private

    def set_medium
      @medium = Medium.find(params[:medium_id])
    end

    def set_episode
      @episode = @medium.episodes.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:title, :description, :season_number, :episode_number)
    end
end
