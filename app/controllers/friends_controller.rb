class FriendsController < ApplicationController
    def index
        @users = current_user.friends
    end
end
