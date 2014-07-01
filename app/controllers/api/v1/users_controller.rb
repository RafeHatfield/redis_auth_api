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
        if REDIS.get(params[:body][:login]) == params[:body][:password]
          render json: { message: 'Authenticated' }, status: 200
        else
          render json: { message: 'Failed' }, status: 401
        end
      end
    end
  end
end
