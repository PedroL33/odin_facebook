module ApplicationHelper
    def get_request_id(from_user)
        Request.find_by(from_id: from_user.id, to_id: current_user.id)
    end

    def logged_in?
        if !signed_in?
            flash[:notice] = "You must be logged in to do that."
            redirect_to root_url
        end
    end
end
