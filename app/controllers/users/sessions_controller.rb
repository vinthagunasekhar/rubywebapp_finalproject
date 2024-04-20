module Users
  class SessionsController < Devise::SessionsController
    # Ensure responses can be HTML or JSON as needed
    respond_to :html, :json
    protect_from_forgery with: :null_session

    # POST /users/sign_in
    def create
      super do |resource|
        if request.format.json?
          if resource.persisted?
            render json: { success: true, user: { id: resource.id, email: resource.email } }, status: :created
          else
            render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity
          end
        end
        # For HTML, the default devise behavior is used, so no need to explicitly handle it here
      end
    end

    private

    # Customize the response upon sign out depending on the format
    def respond_to_on_destroy
      if request.format.json?
        if all_signed_out?
          render json: { success: true, message: "Logged out successfully" }, status: :ok
        else
          render json: { success: false, message: "Logout failed" }, status: :unprocessable_entity
        end
      else
        super
      end
    end
  end
end
