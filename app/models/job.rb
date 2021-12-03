class Job < ApplicationRecord
  belongs_to :user
  has_many :communications
  has_many :events

  validates :company, :position, :status, presence: :true
end
