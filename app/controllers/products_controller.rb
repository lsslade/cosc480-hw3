class ProductsController < ApplicationController
    def index
        #not quite working and I don't know why...
        @products = Product.sort_by("name")
    end

    def show
        id = params[:id]
        @product = Product.find(id)
    end

end
