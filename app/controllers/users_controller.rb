# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :set_user, only: [:show]

  def show
    if @user
      @media = @user.media
    else
      # Redirect to a specific path if user is not found
      redirect_to authenticated_root_path, alert: 'User not found.'
    end
  end
  def index
    # Assuming you want to redirect to the current user's profile
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
