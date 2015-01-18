class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  has_enumeration_for :status, :with => FriendshipStatus, :create_helpers => true
end
