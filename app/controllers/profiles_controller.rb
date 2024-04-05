class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @profile = @user.profile || @user.build_profile
  end

  def new
    @profile = @user.build_profile
  end

  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path(@user), notice: 'Profile created successfully.'
    else
      render :new
    end
  end

  def edit
    @profile = @user.profile
    redirect_to new_user_profile_path(@user) unless @profile
  end

  def update
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to media_url, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:bio)
  end
end
