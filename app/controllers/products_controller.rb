class ProductsController < ApplicationController
    # INDEX
    get '/products' do
        get_products
        erb :'/sessions/products'
    end

    # NEW
    get '/products/new' do
        #Render a new form to create new product
        erb :'/products/new'
    end

    # POST
    post '/products' do 
        #Create a new article instance and save to db.
        @product = Product.create(params[:product])
        redirect '/products'
    end

    # EDIT
    get '/products/:id/edit'
    #Show a form to edit the product
        @product = Product.find(params[:id])
        erb :'products/edit'

    # PATCH

     # SHOW (full product page)
     get '/products/:id' do
        @product = Product.find(params[:id])
        erb :"/sessions/product_view_page"
    end

    # DELETE
    delete "/products/:id" do
        @product = Product.find(params[:id])
        @product.destroy
        redirect '/orders'
    end
end