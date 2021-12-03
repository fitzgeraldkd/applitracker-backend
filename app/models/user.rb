class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :communications, through: :jobs
  has_many :events, through: :jobs

  validates :username, presence: true, uniqueness: { case_sensitive: false }

end
