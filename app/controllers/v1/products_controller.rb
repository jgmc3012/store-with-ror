class V1::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_store
    before_action :set_product, only: %i[update destroy]

    def create
        @product = @store.products.new(product_params)
        if @product.valid?
            @product.save
            render :show, status: :created, formats: [:json]
        else
            render json: { errors: @product.errors.messages }, status: :bad_request
        end
    end

    def update
        if @product.update(product_params)
            render :show, status: :ok, formats: [:json]
        else
            render json: { errors: @product.errors.messages }, status: :bad_request
        end
    end

    def index
        @products = @store.products.all
        render :index, status: :ok, formats: [:json]
    end

    def destroy
        @product.destroy
        head :no_content
    end

    private
    def product_params
        params.permit(:name, :price, :description)
    end

    def set_store
        @store = @current_user.store
    end

    def set_product
        @product = @store.products.find(params[:id])
        head :not_found unless @product
    end
end
