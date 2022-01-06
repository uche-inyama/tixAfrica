class Event < ApplicationRecord
  include  ImageUploader::Attachment(:image)

  belongs_to :user
  validates_presence_of :start_date, :end_date, :time, 
  :address, :theme, :details, :event_type, :status

  # def set_status
  #   if end_date < date.now
  #     status = 'inactive'
  #   end
  # end
end
