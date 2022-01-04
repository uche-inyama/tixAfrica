class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :date, :time, :address, :theme, :details, :image, :event_type, :status
end
