module V1
    class StoresController < ApplicationController
        before_action :authenticate_user!
        before_action :set_store, only: [:show, :update, :destroy]

        def show; end

        private
        def set_store
            if @current_user.store_id.to_s == params[:id]
                @store = @current_user.store
            else
                render json: { error: 'You only cant see detail for your store' }, status: :unauthorized
            end
        end
    end
end
