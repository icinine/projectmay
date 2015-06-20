class LoginsController < ApplicationController
    
    def new
    
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully logged in"
            redirect_to contracts_path
        else
            flash.now[:danger] = "Password or email address incorrect."
            render 'new'
        end
    
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end

