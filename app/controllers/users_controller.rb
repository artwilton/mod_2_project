class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create]

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
        if authenticate_user_edit && @user.update(user_params)
            redirect_to '/profile'
        else 
            flash[:my_errors] = @user.errors.full_messages
            redirect_to '/profile/edit'
        end 
    end

    private

    def authenticate_user_edit
        unless @user.authenticate(params[:user][:password])
            @user.errors.add(:password, 'Password error')
            return false
        else
            return true
        end
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
