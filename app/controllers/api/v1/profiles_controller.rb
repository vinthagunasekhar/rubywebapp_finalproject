module Api
  module V1
    class ProfilesController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :authenticate_user!
      before_action :set_user, only: [:create, :update]

      def create
        profile = @user.build_profile(profile_params)
        if profile.save
          render json: { status: 'success', message: 'Profile created successfully.', data: profile }, status: :created
        else
          render json: { status: 'error', errors: profile.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = current_user # Assumes that you want to update the profile of the current user
      end

      def profile_params
        params.require(:profile).permit(:bio)
      end
    end
  end
end
