class EventsController < ApplicationController
  before_action :set_event, only: [:update, :destory]

  def new
    @event = Event.new
  end

  def index
    @Allevents = Event.all
  end

  def show  
    @events = current_user.events
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path
    else 
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end 

  def event_params
    params.require(:event)
    .permit(:date, :time, :address, :theme, :details, :image, :event_type, :status, :user_id)
  end
end

