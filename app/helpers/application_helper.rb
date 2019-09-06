module ApplicationHelper
    def get_request_id(from_user)
        Request.find_by(from_id: from_user.id, to_id: current_user.id)
    end
end
