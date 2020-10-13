class ProductsController < ApplicationController

    # SHOW (full product page)
    get '/products/:id/edit' do
        @product = Product.find(params[:id])
        erb :"/sessions/product_view_page"
    end

    # INDEX
    get '/products' do
        get_products
        erb :'/sessions/products'
    end

    # NEW

    # POST

    # EDIT

    # PATCH

    # DELETE
    delete "/products/:id" do
        @product = Product.find(params[:id])
        @product.destroy
        redirect '/orders'
    end
end