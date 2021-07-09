class Job < ApplicationRecord
  has_many :applications
  has_many :users, through: :applications

  validates :description, :company, :location,
            :position, :logo, :date, presence: true
end
