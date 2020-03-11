class StaticPagesController < ApplicationController
    def home
        @user = current_user
        @post_feed =  current_user.timeline_feed.paginate(page: params[:page])
        render 'home'
    end
end
