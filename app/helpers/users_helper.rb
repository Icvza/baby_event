module UsersHelper

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
