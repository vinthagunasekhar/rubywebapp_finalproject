class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

  # Redirects to media index page after sign in
  def after_sign_in_path_for(resource)
    user_path(resource) # Adjust the path based on the named route of your media index page
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path  # This points to the login page
  end
  def check_user_status
    Rails.logger.debug "User signed in: #{user_signed_in?}"
  end
end
