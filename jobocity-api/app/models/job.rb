class Job < ApplicationRecord
  validates  :description, :company, :location,
                :technologies,:position,:logo,:date, presence: true
end
