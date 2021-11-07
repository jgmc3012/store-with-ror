class V1::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_store

    def create
        @product = @store.products.new(product_params)
        if @product.valid?
            @product.save
            render :show, status: :created, formats: [:json]
        else
            render json: { errors: @product.errors.messages }, status: :bad_request
        end
    end

    def update; end

    private
    def product_params
        params.permit(:name, :price, :description)
    end

    def set_store
        @store = @current_user.store
    end
end
