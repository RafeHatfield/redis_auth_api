module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def create
        if REDIS.exists(params[:body][:login])
        else
          REDIS.set(params[:body][:login], params[:body][:password])
          render json: { message: 'Success' }, status: 200
        end
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
