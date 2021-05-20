class EventsController < ApplicationController
  include EventsHelper
  before_action :set_event, only: [:update, :destroy, :show]
  before_action :require_ownership, except: [:new, :create, :index]
  def index
    if params[:baby_id]
      @events = Event.where(baby_id: params[:baby_id])
    else
    @events = Event.all
    end
    @events132 = Event.latest_event
    binding.pry
  end

  def show
    
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
      @event = Event.find(params[:baby_id])
    else
      set_event
    end
  end

  def update
    if @event.update(event_params)
      redirect_to user_path(@event.user_id)
    else 
      render :edit
    end 
  end

  def destroy
    @event.destroy
    redirect_to signup_path
  end

end
