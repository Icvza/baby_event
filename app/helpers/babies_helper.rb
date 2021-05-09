module BabiesHelper
    def set_baby
        @baby = Baby.find(params[:id])
    end

    def baby_params
      params.require(:baby).permit(:name, :DOB, :user_id)
    end 
    
    def require_ownership
      if set_baby.user_id != current_user.id
        redirect_to user_path(@baby.user_id)
     end
    end
end
