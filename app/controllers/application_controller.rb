require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "app"
      set :method_override, true
  end

  helpers do

      def logged_in?
          !!current_user
      end

      def current_user
        @user = User.find_by(:username => username)
        session[:username] = user.username
          # @current_user = User.find_by(:username => session[:username]) if session[:username]
      end

      def get_products
        @products = Product.all 
      end
      
      # def login(username, password)
      #     #check if a user with this email actually exists
      #     @user = User.find(params[:username] => username)
      #     if user && user.authenticate(params[:password]lj 
      #       )
      #     session[:username] = @user.username
      #     else
      #         redirect '/login'
      #     end
      # end

      def logout
          session.clear
      end
  end

end
