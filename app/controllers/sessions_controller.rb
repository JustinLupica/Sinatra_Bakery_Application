class SessionsController < ApplicationController

    get '/login' do
    erb :"sessions/login"
    end

    post "/login" do
        #login a user with this email
        login(params[:username], params[:password])
        redirect '/products'
    end

    get '/logout' do
        logout
        redirect '/login'
    end

end