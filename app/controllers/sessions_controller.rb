class SessionsController < ApplicationController
  def new
  end

  # In your SessionsController
  def create
     user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: 'Logged in successfully'
     else
        flash.now[:alert] = 'Invalid email or password, or account does not exist. Please sign up.'
        render 'new'
      end
    end


  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
