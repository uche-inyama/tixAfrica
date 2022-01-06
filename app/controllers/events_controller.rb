class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @all_events = Event.all
    @events = current_user.events
  end

  def show  
    @event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else 
      render :new
    end
  end

  def edit
    @event
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end 

  def event_params
    params.require(:event)
      .permit(:start_date, :end_date, :time, :address, :theme, :details, :image, :event_type, :status, :user_id)
  end
end

