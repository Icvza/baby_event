class EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy, :show]
  before_action :require_ownership, except: [:edit, :new, :create, :index]
  def index
    @events = Event.all
  end

  def show
    #@event = Event.find_by(params[:id])
  end

  def new 
    if params[:baby_id]
      @baby = Baby.find_by(id: params[:baby_id])
      @event = Event.new
    else 
      @event = Event.new
    end 
  end

  def create
    @event = Event.new(event_params)
    if @event.save 
      redirect_to user_path(current_user.id) 
    else 
    render :new
    end 
  end

  def edit
    if params[:baby_id]
    require_ownership_for_nested_route
      @event = Event.find(params[:baby_id])
    else
      set_event
    end
  end

  def update
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to user_path(@event.user_id)
    else 
      render :edit
    end 
  end

  def destroy
    #@event = Event.find(params[:id])
    @event.destroy
    redirect_to signup_path
  end

  private
    def set_event
      @event = Event.find_by(params[:id])
    end

    def event_params
      params.require(:event).permit(:content, :time, :user_id, :baby_id)
    end 

    def require_ownership
      if set_event.user_id != current_user.id
        redirect_to user_path(params[:id])
     end
    end

    def require_ownership_for_nested_route
      if current_user.id != params[:id].to_i
        redirect_to user_path(params[:id])
      end
    end
end
