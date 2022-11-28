class Post < ApplicationRecord
  belongs_to :chat_room
  belongs_to :movie, through: :chat_room
  belongs_to :user
  has_many :replies
end
