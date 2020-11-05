class PostsController < ApplicationController
    get '/posts/new' do
        if logged_in?
            erb :'posts/new'
        else
            redirect '/login'
        end
    end

    get '/posts' do
        if !logged_in?
            redirect '/login'
        else
            if post = current_user.posts.find_by(params[:id])
                @post = current_user.posts
                erb :'posts/posts'
            else
                redirect '/login'
            end
        end
    end

    post '/posts' do
        @post = Post.new(params[:post])
        @post.user_id = current_user.id
        @post.save
        redirect '/posts'
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