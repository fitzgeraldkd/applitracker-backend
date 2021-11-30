class User < ApplicationRecord
  has_many :jobs
  has_many :communications, through: :jobs
  has_many :events
end
