class CommentsController < ApplicationController
    before_action :logged_in?
        
    def create
        comment = current_user.comments.build(comment_params)
        if comment.save
            flash[:success] = "You have commented on #{comment.creator.first_name}'s post."
            redirect_to root_url
        else
            flash[:danger] = "Content required"
            redirect_to root_url
        end
    end

    def destroy
        Comment.find(params[:id]).destroy
        flash[:success] = "Comment removed"
        redirect_to root_url
    end

private
    
    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
end
