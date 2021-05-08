class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end


  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end


  def create
    @event = Event.new(event_params)
  end

  def update
   
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.fetch(:event, {})
    end
end
