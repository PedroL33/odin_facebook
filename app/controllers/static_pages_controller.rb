class StaticPagesController < ApplicationController
    def home
        @post_feed =  current_user.timeline_feed.paginate(page: params[:page])
        render 'home'
    end
end
