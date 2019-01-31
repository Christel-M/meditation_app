class Blog < ApplicationRecord

  validates :title, :description, presence: true
  validates :tags, format: {with: /\A#[a-z]/}

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :image

end
