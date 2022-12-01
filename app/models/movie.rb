class Movie < ApplicationRecord
  has_one :chat_room
  has_many :posts, through: :chat_room
  has_many :replies, through: :posts

  include PgSearch::Model
  pg_search_scope :search_by_title_and_year,
    against: [ :title, :year ],
    using: {
      tsearch: { prefix: true }
    }
end
