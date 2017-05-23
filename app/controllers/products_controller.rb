class ProductsController < ApplicationController

    def index
        @products = Product.all
    end
    
    def new
    	@product = Product.new
    end

    def create
    	@product = Product.new(product_params)
    	@product.save
    	redirect_to products_path
    end

    def description
    	@product = Product.find_by(id: params[:id])
    	render plain: @product.description
    end

     def inventory
    	@product = Product.find_by(id: params[:id])
    	render plain: (@product.inventory > 0).to_s
    end

    private

    def product_params
    	params.require(:product).permit(:name, :price, :description, :inventory)
    end

end
