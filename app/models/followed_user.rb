class FollowedUser < ApplicationRecord
  belongs_to :followed_user_id
  belongs_to :user_id
end
