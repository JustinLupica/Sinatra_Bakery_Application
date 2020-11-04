class SessionsController < ApplicationController

    get '/login' do
    erb :"sessions/login"
    end

    post "/login" do
        #login a user with this email
        login(params[:username], params[:password])
        redirect '/products'
    end

    # post '/login' do
    #     #login a user with this email
    #     @user = User.find_by(:username => params[:username], password: params[:password])
    #     if @user
    #         session[:username] = @user.username
    #         get_products
    #         erb :"products/products"
    #     else
    #         redirect '/login'
    #     end
    #     # login(params[:username], params[:password])
    #     # redirect '/orders'
    # end

    get '/logout' do
        logout
        redirect '/login'
    end

end