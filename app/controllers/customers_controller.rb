class CustomersController < ApplicationController

    #Index all customers into a table
    get '/customers' do
        @customer = Customer.all
        erb :'/customers/customers'
    end

    # NEW
    get '/customers/new' do
        #Render a new form to create new product
        erb :'/customers/new'
    end

    # POST
    post '/customers' do 
        #Create a new article instance and save to db.
        @customer = Customer.create(params[:customer])
        redirect '/customers'
    end

    
    #show a specific customers info page
    get '/customers/:id' do
        @customer = Customer.find(params[:id])
        erb :"/customers/customer_view_page"
    end

    # EDIT
    get '/customers/edit/:id' do
        @customer = Customer.find(params[:id])
        erb :'/customers/edit'
    end

    # PATCH
    patch '/customers/patch/:id' do
        @customer = Customer.find(params[:id])
        @customer.update(params[:customer])
        redirect '/customers'
    end

    # DELETE
    delete "/customers/delete/:id" do
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect '/customers'
    end

end