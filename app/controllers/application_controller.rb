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
          #!!session[:username]
          !!current_user
      end

      def login(username, password)
        #Check to see if a user with this username exists
        user = User.find_by(:username => username)
        if user && user.authenticate(password)
          session[:username] = user.username
        else
          redirect '/login'
        end
      end

      def current_user
        @current_user ||= User.find_by(:username => session[:username]) if session[:username]
      end

      # def current_customer(id)
      #   @current_customer = Customer.find_by(:id => id)
      # end

      def get_products
        @products = Product.all 
      end

      def logout
          session.clear
      end
  end

end
