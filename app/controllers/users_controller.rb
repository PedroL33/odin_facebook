class UsersController < ApplicationController
    before_action :logged_in?
    
    def show 
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
    end

    def index
        @users = User.paginate(page: params[:page])
    end

end
