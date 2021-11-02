module V1
  class UsersController < ApplicationController
    def create
      begin
        @user = Owner.create!(user_params)
      rescue ActiveRecord::RecordInvalid, ActionController::ParameterMissing
        render json: { error: 'Invalid user' }, status: :bad_request
        return
      end
      render :show, status: :created, formats:[:json]
    end

    private

    def user_params
      {
        email: params.require(:email),
        password: params.require(:password),
        birthdate: params.require(:birthdate),
        store_attributes: params.require(:store_attributes).permit(:name)
      }
    end
  end
end
