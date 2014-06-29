module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def create
        render json: { message: 'Create method' }, status: 200
      end

      def authenticate
        render json: { message: 'Authenticate method' }, status: 200
      end

      private

      # Only allow a trusted parameter "white list" through.
      # def user_params
      #   params.require(:user).permit(:login, :password)
      # end
    end
  end
end
