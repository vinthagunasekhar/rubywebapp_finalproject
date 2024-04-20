module Api
  module V1
    class MediaController < ApplicationController
      before_action :authenticate_user!

      def index
        media = current_user.media
        render json: { status: 'success', data: media }, status: :ok
      end

      def show
        medium = Medium.find(params[:id])
        render json: { status: 'success', data: medium }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { status: 'error', message: 'Media not found' }, status: :not_found
      end
    end
  end
end
