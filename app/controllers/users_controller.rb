class UsersController < ApplicationController
    before_action :set_user, only [:edit, :update, :show]
    before_action :require_same_user, only [:edit, :update]
    

def index
   @users = User.paginate(page: params[:page], per_page: 3)
end

def new
     @user = User.new
end


def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Congratulations! New User Created."  
        session[:user_id] = @user.id
        redirect_to contracts_path
    else
        render 'new'
    end
    
end

def edit
    
end


def update
 
    if @user.update(user_params)
        flash[:success] = "Your profile has been updated successfully."
        redirect_to user_path(@user)
    else
        render 'edit'    
    end
    
end

def show
  
    @contracts = @user.contracts.paginate(page: params[:page], per_page: 3)
end


private

    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
    
    def set_user
         @user = User.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user
            flash[:danger] = "Comuter says no"
            redirect_to root_path
        end
    end
    
    
end
