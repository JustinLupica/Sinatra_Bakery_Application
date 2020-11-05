class OrdersController < ApplicationController

        #Index all customers into a table
        get '/orders' do
            if logged_in?
                @order = Order.all
                erb :'/orders/orders'
            else
                redirect '/login'
            end
        end
    
        # NEW
        get '/orders/new' do
            if logged_in?
                 #Render a new form to create new product
                 erb :'/orders/new'
            else
                redirect '/login'
            end
        end
    
        # POST
        post '/orders' do 
            #Create a new article instance and save to db.
            @order = Order.create(params[:order])
            @order.customer = @current_customer
            if @order.save           
                redirect '/orders'
            else
                redirect '/login'
            end
        end
    
        
        #show a specific customers info page
        get '/orders/:id' do
            if logged_in?
                @order = Order.find(params[:id])
                erb :"/orders/order_view_page"
            else
                redirect '/login'
            end
        end

        ###### --- TEST ROUTE ---- #####

        get '/orders/:id/edit' do
               if order = current_customer.orders.find_by(params[:id])
                    "A edit order form - Customer #{current_customer.id} is editing their order #{order.id}"
                else
                redirect '/login'
                end
        end

        ########################
    
        # EDIT
        get '/orders/edit/:id' do
            if logged_in?
                @order = Order.find(params[:id])
                erb :'/orders/edit'
            else
                redirect '/login'
            end
        end
    
        # PATCH
        patch '/orders/patch/:id' do
            @order = Order.find(params[:id])
            @order.update(params[:order])
            redirect '/orders'
        end
    
        # DELETE
        delete "/orders/delete/:id" do
            @orders = Order.find(params[:id])
            @orders.destroy
            redirect '/orders'
        end
end