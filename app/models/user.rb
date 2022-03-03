class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :likes
  has_many :notifications, foreign_key: :recipient_id

  def likes?(event)
    event.likes.where(user_id: id).any?
  end
end
