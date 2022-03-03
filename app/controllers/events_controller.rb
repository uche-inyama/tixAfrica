class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :get_users, only: [:create]

  def new
    @event = Event.new
  end

  def index
    @all_events = Event.all.order(created_at: :desc).limit(4)
    @events = current_user.events
  end

  def show  
    @event
  end

  def create
    @event = current_user.events.build(event_params)
    debugger
    if @event.save
      @users.each do |user|
        Notification.create(recipient: user, user: current_user, action: "posted", notifiable: @event)
      end
      redirect_to events_path, notice: "Event successfully created"
    else
      render :new
    end
  end

  def edit
    @event
  end

  def update
    @event.update(event_params)
    redirect_to events_path, notice: "Event successfully updated"
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event successfully deleted"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end 
  
  def get_users
    @users = User.where.not(id: current_user.id)
  end

  def event_params
    params.require(:event)
      .permit(:start_date, :end_date, :time, :address, :theme, :details, :image, :event_type, :status, :user_id)
  end
end

