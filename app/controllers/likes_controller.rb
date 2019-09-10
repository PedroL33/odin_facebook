class LikesController < ApplicationController
    before_action :logged_in?
    
    def create
        like = current_user.likes.build(post_id: params[:post_id])
        if like.save
            flash[:success] = "Post liked."
            redirect_to root_url
        else
            flash[:danger] = "Counld not like this post."
            redirect_to root_url
        end
    end

end
