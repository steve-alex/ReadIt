class SessionsController < ApplicationController

    def new
        session.destroy
    end

    def create
        @user = User.find_by(username: params[:user][:username])

        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.destroy
        redirect_to new_session_path
    end

end
