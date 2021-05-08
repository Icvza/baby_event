class UsersController < ApplicationController

    def index
      @users = User.all
    end
  
    def show 
      if params[:id] == session[:user_id]
      @user = User.find_by_id(params[:id])
      else
      @user = User.find_by_id(params[:id])
      end
    end
  
    def new 
      @user = User.new
    end
  
    def edit
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
        flash[:errors] = @user.errors.full_messages
          render :new
      end
    end
  
    def update
      
    end
  
    def destroy
      @user.destroy
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:name, :email, :password_digest, :username)
    end 
end
