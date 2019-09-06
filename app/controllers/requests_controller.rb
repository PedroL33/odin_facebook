class RequestsController < ApplicationController
    
    def index
        user = User.find(current_user.id)
        @to_requests = user.to_requests
    end

    def create
        request = Request.new(from_id: current_user.id, to_id: params[:to], status: 'pending')
        if request.save
            flash[:success] = "Friend request sent to #{request.to_user.first_name}"
            redirect_to users_path
        else
            request.errors.full_messages.each { |item| flash[:danger] = item }
            redirect_to users_path
        end
    end

    def update
        request = Request.find(params[:id])
        request.status = 'accepted'
        if request.save
            flash[:success] = "You are now friends with #{request.from_user.first_name}"
            redirect_to users_path
        else
            request.errors.full_message.each { |item| flash[:danger] = item }
            redirect_to users_path
        end
    end
end
