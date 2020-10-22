class UsersController < ApplicationController

    before_action :require_login, except: :new

    def new
    end

    def create
        @user = User.new(user_params)
        unless @user.save
            flash[:errors] = @user.errors.full_messages
            render :new
            # redirect_to new_user_path(@user)
        else
            session[:user_id] = @user.id
            redirect_to '/'
        end
    end

    def profile
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to '/profile'
        else 
            flash[:my_errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end 
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :username,
            :password,
            :password_confirmation,
            :profile_picture
        )
    end
end
