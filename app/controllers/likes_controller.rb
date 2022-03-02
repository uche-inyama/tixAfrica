class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @event.likes.where(user_id: current_user.id).first_or_create
    
    respond_to do |format|
      format.html { redirect_to events_path }
      format.js
    end
  end

  def destroy
    @event.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format| 
      format.html { redirect_to events_path }
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end