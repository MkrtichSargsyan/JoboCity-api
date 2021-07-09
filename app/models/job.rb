class Job < ApplicationRecord
  validates  :description, :company, :location,
                :position,:logo,:date, presence: true
end
