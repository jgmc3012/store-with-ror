module V1
  class UsersController < ApplicationController
    def create
      begin
        user = Owner.create!(user_params)
      rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing
        render json: { error: 'Invalid user' }, status: :bad_request
        return
      end
      render json: user, status: :created
    end

    private

    def user_params
      {
        email: params.require(:email),
        password: params.require(:password),
        birthdate: params.require(:birthdate),
      }
    end
  end
end
