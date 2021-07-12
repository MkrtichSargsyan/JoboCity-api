class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :password, length: { minimum: 4 }

  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications
end
 