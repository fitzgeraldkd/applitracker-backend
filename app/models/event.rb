class Event < ApplicationRecord
  belongs_to :job

  validates :title, :description, :date, presence: true
end
