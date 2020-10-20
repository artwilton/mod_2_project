class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)
        unless @user.save
            flash[:errors] = @user.errors.full_message
            redirect_to '/signup'
        else
            session[:user_id] = @user.id
            redirect_to '/'
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :username,
            :password,
            :password_confirmation
        )
    end
end
