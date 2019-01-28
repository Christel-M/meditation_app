class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, :on => :create

  has_many :blogs, dependent: :destroy
  belongs_to :location, optional: true
  belongs_to :level, optional: true

  has_secure_password

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
      existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end

end
