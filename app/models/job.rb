class Job < ApplicationRecord
  belongs_to :user
  has_many :communications
  has_many :events
end
