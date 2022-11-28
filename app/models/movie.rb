class Movie < ApplicationRecord
  has_one :chat_room
  has_many :posts, through: :chat_room
  has_many :replies, through: :posts
end
