class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def welcome
        @user = params[:user]
        @url  = 'http://localhost:3000/'
        mail(to: @user.email, subject: 'Welcome to facebook')
    end
end
