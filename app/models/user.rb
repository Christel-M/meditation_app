class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, :on => :create

  has_many :blogs, dependent: :destroy
  belongs_to :location, optional: true
  belongs_to :level, optional: true

  has_secure_password

end
