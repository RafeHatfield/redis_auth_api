module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def create
        result = CreateUser.call(params[:body][:login], params[:body][:password])
        render_result(result)
      end

      def authenticate
        result = AuthenticateUser.call(params[:body][:login], params[:body][:password])
        render_result(result)
      end

      private

      def render_result(result)
        render json: { message: result[:message] }, status: result[:status]
      end
    end
  end
end
