class Level < ApplicationRecord
  validates :name, presence: true

  has_many :lessons
  has_many :users
end
