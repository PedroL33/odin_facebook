class UsersController < ApplicationController

    def show 
        @user = User.find(current_user.id)
    end

    def index
        @users = User.paginate(page: params[:page])
    end

end
