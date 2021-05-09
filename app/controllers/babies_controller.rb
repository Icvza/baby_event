class BabiesController < ApplicationController
  include BabiesHelper
  before_action :require_ownership, except: [:new, :create]
  before_action :set_baby, only: [:update, :edit, :destroy, :show]
    
    def index
      @babies = Baby.where(user_id: current_user.id)
    end
  
    def show
      @baby = Baby.find_by(params[:id])
    end
  
    def new
      @baby = Baby.new
    end
   
    def create
      @baby = current_user.babies.build(baby_params)
       if @baby.save
         redirect_to user_path(@baby.user_id) 
       else
        render :new
       end
    end

    def edit
      @baby = Baby.find(params[:id])
    end
  
    def update
      @baby = Baby.find(params[:id])
      if @baby.update(baby_params)
        redirect_to user_path(@baby.user_id)
      else 
        render :edit
      end 
    end
  
    def destroy
      @baby = Baby.find(params[:id])
      @baby.destroy
      redirect_to signup_path
    end
end
