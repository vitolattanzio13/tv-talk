class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :followed_movies, dependent: :destroy
  has_one :notification, dependent: :destroy
  has_one_attached :photo
  has_many :followed_users_as_followee, class_name: "FollowedUser", foreign_key: :followee_id
  has_many :followed_users_as_follower, class_name: "FollowedUser", foreign_key: :follower_id

  after_create do
    Notification.create!(user_id: self.id)
  end
end
