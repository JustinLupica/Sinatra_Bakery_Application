class UsersController < ApplicationController
    get '/signup' do
        erb :"users/new_user"
    end

    post '/users' do
        @user = User.new
        @user.username = params[:username]
        @user.password = params[:password]
        if @user.save
            session[:username] = @user.username
        redirect '/products'
        else
        erb :"users/new_user"
        end
    end
end
