class PostsController < ApplicationController
    get '/posts/new' do
        if logged_in?
            "A new post form"
        else
            redirect '/login'
        end
    end

    get '/posts/:id/edit' do
        if !logged_in?
            redirect '/login'
        else
           if post = current_user.posts.find_by(params[:id])
                "A edit post form - user #{current_user.id} is editing post #{post.title}"
            else
            redirect '/login'
            end   
        end
    end
end