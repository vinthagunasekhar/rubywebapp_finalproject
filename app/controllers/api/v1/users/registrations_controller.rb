module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        protect_from_forgery with: :null_session
        skip_before_action :verify_authenticity_token
        respond_to :json

        # POST /api/v1/users
        def create
          build_resource(sign_up_params)

          resource.save
          if resource.persisted?
            if resource.active_for_authentication?
              sign_in(resource_name, resource)
              render json: { success: true, message: 'Signed up successfully.', user: { id: resource.id, email: resource.email } }, status: :created
            else
              expire_data_after_sign_in!
              render json: { success: true, message: 'Signed up but inactive.', user: { id: resource.id, email: resource.email } }, status: :ok
            end
          else
            clean_up_passwords(resource)
            render json: { success: false, message: 'Sign up failed.', errors: resource.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
