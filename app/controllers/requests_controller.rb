class RequestsController < ApplicationController
    
    before_action :logged_in?
    
    def index
        user = User.find(current_user.id)
        @to_requests = user.to_requests
        @from_requests = user.from_requests
    end

    def create
        request = Request.new(from_id: current_user.id, to_id: params[:to], status: 'pending')
        if request.save
            flash[:success] = "Friend request sent to #{request.to_user.first_name}"
            redirect_to '/'
        else
            request.errors.full_messages.each { |item| flash[:danger] = item }
            redirect_to '/'
        end
    end

    def update
        request = Request.find(params[:id])
        request.status = 'accepted'
        if request.save
            flash[:success] = "You are now friends with #{request.from_user.first_name}"
            redirect_to '/'
        else
            request.errors.full_message.each { |item| flash[:danger] = item }
            redirect_to '/'
        end
    end
end
