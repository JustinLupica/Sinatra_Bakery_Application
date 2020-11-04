class CustomersController < ApplicationController

    #Index all customers into a table
    get '/customers' do
        if logged_in?
            @customer = Customer.all
            erb :'/customers/customers'
        else
            redirect '/login'
        end
    end

    get '/customers/select' do
        if logged_in?
            @customer = Customer.all
            erb :'/customers/customer_select'
        else
            redirect '/login'
        end
    end

    # NEW
    get '/customers/new' do
        if logged_in?
            #Render a new form to create new product
            erb :'/customers/new'
        else
            redirect '/login'
        end
    end

    # POST
    post '/customers' do 
        #Create a new article instance and save to db.
        @customer = Customer.create(params[:customer])
        redirect '/customers'
    end

    get '/customers/select/:id' do
        if logged_in?
            @customer = Customer.find(params[:id])
            erb :'/orders/new'
        else
            redirect '/login'
        end
    end

    
    #show a specific customers info page
    get '/customers/:id' do
        if logged_in?
            @customer = Customer.find(params[:id])
            erb :"/customers/customer_view_page"
        else
            redirect '/login'
        end
    end

    # EDIT
    get '/customers/edit/:id' do
        if logged_in?
            @customer = Customer.find(params[:id])
            erb :'/customers/edit'
        else
            redirect '/login'
        end
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