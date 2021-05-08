class BabiesController < ApplicationController
    before_action :set_baby, only: %i[ show edit update destroy ]

    def index
      @babies = Baby.all
    end
  
    def show
    end
  
    def new
      @baby = Baby.new
    end
  
   
    def edit
    end
  
    
    def create
      @baby = Baby.new(baby_params)
    end
  
    def update

    end
  
    def destroy
      @baby.destroy
    end
  
    private
      def set_baby
        @baby = Baby.find(params[:id])
      end
  
      def baby_params
        params.fetch(:baby, {})
      end
  
end
