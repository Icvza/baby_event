class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :set_user, only: [:update, :edit, :destroy, :show]
    def index
      @users = User.all
    end
  
    def show 
    
    end
  
    def new 
      if !logged_in?
        @user = User.new
      else
        redirect_to user_path(current_user.id)
      end
    end
  
    def create 
      @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user.id) 
        else 
          flash[:errors] = @user.errors.full_messages
          render :new
        end 
    end

    def edit 
      
    end
  
    def update
      
      if @user.update(user_params)
        redirect_to user_path(@user)
      else 
        render :edit
      end 
      
    end
  
    def destroy
      @user.destroy
      redirect_to signup_path
    end
  
    private
      def set_user
        @user = current_user
      end
  
      def user_params
        params.require(:user).permit(:name, :email, :username, :email, :password)
    end 

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
  
end
