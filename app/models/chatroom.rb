class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :slug, presence: true, uniqueness: true
  validates :topic, presence: true
end
