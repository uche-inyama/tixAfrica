class Event < ApplicationRecord
  include  ImageUploader::Attachment(:image)

  belongs_to :user
  validates_presence_of :start_date, :end_date, :time, 
  :address, :theme, :details, :event_type, :status, :image

  validates_date :start_date, :on_or_after => lambda { Date.current },
  :on_or_after_message => "must be on or after today's date.",
  :invalid_date_message => "is empty"

  validates_date :end_date, :on_or_after => lambda { Date.current },
  :invalid_date_message => "is empty",
  :on_or_after_message => "must be on or after today's date."

  def get_status(date)
    current_date = DateTime.now.strftime('%Y-%m-%d')
    end_date = date.strftime('%Y-%m-%d')
    end_date < current_date ? 'inactive' : 'active'
  end
end
