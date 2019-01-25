class Lesson < ApplicationRecord

  validates :name, :content, presence: true

  belongs_to :level

end
