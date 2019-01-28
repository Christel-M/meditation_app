class Blog < ApplicationRecord

  validates :title, :description, presence: true
  validates :tags, format: {with: /\A#[a-z]/}

  belongs_to :user
  
end
