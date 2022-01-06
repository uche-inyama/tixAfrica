class Event < ApplicationRecord
  include  ImageUploader::Attachment(:image)

  belongs_to :user
  validates_presence_of :start_date, :end_date, :time, 
  :address, :theme, :details, :event_type, :status

  def get_status(date)
    current_date = DateTime.now.strftime('%Y-%m-%d')
    end_date = date.strftime('%Y-%m-%d')
    end_date < current_date ? 'inactive' : 'active'
  end
end
