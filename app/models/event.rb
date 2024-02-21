class Event < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :tipo_de_eventos, presence: true
  validates :reminder_datetime, presence: true
end
