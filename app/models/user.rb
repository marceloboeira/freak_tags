class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :foreign_key => :friend_id, :class_name => 'Friendship', :through => :friendships

  acts_as_birthday :birthday
  has_enumeration_for :gender, :with => Gender, :create_helpers => true

  validates :name, presence: true, length: { in: 2..50 }
  validates :username, presence: true, uniqueness: true, username: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, email: true, length: { in: 5..50 }
  validates :gender, presence: true
  validates :birthday, allow_blank: true, date: { after: DateTime.now - 100.years,
                                                  before: DateTime.now - 01.years }
  validates :description, length: { maximum: 500 }

  def age
    birthday_age
  end

  def has_friends?
    !friends.empty?
  end

  def real_friends
    friends.where(:status => FriendshipStatus::ACCEPTED)
  end
end
