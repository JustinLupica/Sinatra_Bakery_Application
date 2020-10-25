class OrdersController < ApplicationController

        #Index all customers into a table
        get '/orders' do
            @order = Order.all
            erb :'/orders/orders'
        end
    
        # NEW
        get '/orders/new' do
            #Render a new form to create new product
            
            erb :'/orders/new'
        end
    
        # POST
        post '/orders' do 
            #Create a new article instance and save to db.
            @orders = Orders.create(params[:orders])
            redirect '/orders'
        end
    
        
        #show a specific customers info page
        get '/orders/:id' do
            @order = Order.find(params[:id])
            erb :"/orders/order_view_page"
        end
    
        # EDIT
        get '/orders/edit/:id' do
            @order = Order.find(params[:id])
            erb :'/orders/edit'
        end
    
        # PATCH
        patch '/orders/patch/:id' do
            @orders = Orders.find(params[:id])
            @orders.update(params[:id])
            redirect '/orders'
        end
    
        # DELETE
        delete "/orders/delete/:id" do
            @orders = Orders.find(params[:id])
            @orders.destroy
            redirect '/orders'
        end
end