module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        protect_from_forgery with: :null_session
        skip_before_action :verify_authenticity_token
        respond_to :json

        # POST /api/v1/users/sign_in
        def create
          user = warden.authenticate!(auth_options)
          sign_in(resource_name, user)
          render json: { success: true, message: 'Signed in successfully.', user: { id: user.id, email: user.email } }, status: :ok
        end

        # DELETE /api/v1/users/sign_out
        def destroy
          sign_out(resource_name)
          render json: { success: true, message: 'Signed out successfully.' }, status: :ok
        end
      end
    end
  end
end
