class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

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

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            flash[:my_errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end 
    end

    private

    def find_user 
        @user = User.find(params[:id])
    end 

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
