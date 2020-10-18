class ProductsController < ApplicationController
    # INDEX
    get '/products' do
        if !logged_in?
            redirect '/login'
        else
            get_products
            erb :'/products/products'
        end
    end

    # NEW
    get '/products/new' do
        #Render a new form to create new product
        if !logged_in?
            redirect '/login'
        else
            erb :'/products/new'
        end
    end

    # POST
    post '/products' do 
        #Create a new article instance and save to db.
        @product = Product.create(params[:product])
        redirect '/products'
    end

    # EDIT
    get '/products/edit/:id' do
        @product = Product.find(params[:id])
        erb :'/products/edit'
    end

    # PATCH
    patch '/products/patch/:id' do
        @product = Product.find(params[:id])
        @product.update(params[:product])
        redirect '/products'
    end

     # SHOW (full product page)
     get '/products/:id' do
        @product = Product.find(params[:id])
        erb :"/products/product_view_page"
    end

    # DELETE
    delete "/products/delete/:id" do
        @product = Product.find(params[:id])
        @product.destroy
        redirect '/products'
    end
end