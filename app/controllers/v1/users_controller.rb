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

    def login
      @user = Owner.find_by(email: params.require(:email))
      if @user.nil?
        render json: { error: 'Invalid email or password' }, status: :bad_request
        return
      end

      if @user.authenticate(params.require(:password))
        render :show, status: :ok, formats:[:json]
        return
      end

      render json: { error: 'Invalid email or password' }, status: :bad_request

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
