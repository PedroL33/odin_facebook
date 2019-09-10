class PostsController < ApplicationController
    before_action :logged_in?
    before_action :correct_user, only: [:destroy]

    def index
        @posts = current_user.timeline_feed
    end

    def create
        post = current_user.posts.build(post_params)
        if post.save
            flash[:success] = "Post created"
            redirect_to root_url
        else
            flash[:danger] = "Must contain content"
            redirect_to root_url
        end
    end 

    def destroy
        Post.find(params[:id]).destroy
        flash[:success] = "Post deleted."
        redirect_to root_url
    end

private
    def post_params
        params.require(:new_post).permit(:content, :picture)
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_url if @post.nil?
    end
end
