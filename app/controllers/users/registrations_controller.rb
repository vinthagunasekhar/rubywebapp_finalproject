class Users::RegistrationsController < Devise::RegistrationsController
  # If you're not using this controller for HTML responses, you can remove the next line
  # respond_to :html, :json

  # Disabling CSRF protection for API calls
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :json_request?

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        # Set up a message and sign in the user here if you want to
        render json: { success: true, user: { id: resource.id, email: resource.email } }, status: :created
      else
        expire_data_after_sign_in!
        render json: { success: true, user: { id: resource.id, email: resource.email } }, status: :ok
      end
    else
      clean_up_passwords(resource)
      set_minimum_password_length
      render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  protected

  # Check if the request is a JSON format
  def json_request?
    request.format.json?
  end
end
