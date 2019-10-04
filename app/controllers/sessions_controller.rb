class SessionsController < ApplicationController
    layout 'login'

    def new
        session[:user_id] = User.new.id
    end

    def create
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:notice] = "Welcome back #{@user.username}!"
            redirect_to user_path(@user)
        else
            flash[:notice] = "A user with this username and password combination could not be found. Please try again."
            redirect_to new_session_path
        end
    end

    def destroy
        session.destroy
        redirect_to new_session_path
    end

end