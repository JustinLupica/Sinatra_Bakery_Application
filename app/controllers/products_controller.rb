class ProductsController < ApplicationController
    # INDEX
    get '/products' do
        if logged_in?
            get_products
            erb :'/products/products'
        else
            redirect '/login'
        end
    end

    # NEW
    get '/products/new' do
        #Render a new form to create new product
        if logged_in? 
            erb :'/products/new'
        else 
            redirect '/login'
        end
    end

    # POST
    post '/products' do 
        #Create a new article instance and save to db.
            @product = Product.new(params[:product])
            if @product.save
             redirect '/products'
            else
                redirect '/login'
            end
    end

    # EDIT
    get '/products/edit/:id' do
        if logged_in?
             @product = Product.find(params[:id])
             erb :'/products/edit'
        else 
            redirect '/login'
        end
    end

    # PATCH
    patch '/products/patch/:id' do
        @product = Product.find(params[:id])
        if @product.update(params[:product])
            redirect '/products'
        else
            redirect '/login'
        end
    end

     # SHOW (full product page)
     get '/products/:id' do
        if logged_in?
            @product = Product.find(params[:id])
            erb :"/products/product_view_page"
        else
            redirect '/login'
        end
    end

    # DELETE
    delete "/products/delete/:id" do
        @product = Product.find(params[:id])
        @product.destroy
        redirect '/products'
    end

end