class ChatRoom < ApplicationRecord
  belongs_to :movie
  has_many :posts
  has_many :replies, through: :post
end
