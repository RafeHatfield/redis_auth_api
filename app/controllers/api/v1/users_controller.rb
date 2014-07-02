module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def create
        errors = ValidateUser.call(params[:body][:login], params[:body][:password])

        if errors.length > 0
          render json: { message: errors.join(', ') }, status: 403
        else
          CreateUser.call(params[:body][:login], params[:body][:password])
          render json: { message: 'Success' }, status: 200
        end
      end

      def authenticate
        result = AuthenticateUser.call(params[:body][:login], params[:body][:password])
        render json: { message: result[:message] }, status: result[:status]
      end
    end
  end
end
