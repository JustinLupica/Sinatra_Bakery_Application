class OrdersController < ApplicationController

    get '/orders' do
        erb :"sessions/orders"
    end

    get '/orders/new' do
        #Checking if they are logged in
        if !session[:email]
            redirect '/login' #Redirect if not logged in
        else
            erb :"sessions/new_order"
        end
    end

    post '/order/new' do
        # Create a new order instance with information from the user
        @order = Order.new
        @order.product_id = params[:product_id]
        @order.pickup_date = params[:pickup_date]
    end

    get '/orders/:id/edit' do 
        if !logged_in?
            redirect '/login' #Redirect if not logged in
        else
           if order = current_user.orders.find_by(params[:id])
            "An edit order form #{current_user.id} is editing #{order.id}."
           else
            redirect '/orders'
           end
        end
    end
end