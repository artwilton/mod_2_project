class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to '/login' unless @user
        session[:user_id] = @user.id
        redirect_to '/profile'
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
