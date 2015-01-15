class User < ActiveRecord::Base

  acts_as_birthday :birthday
  has_enumeration_for :sex, :with => Sex, :create_helpers => true

  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email
  validates_length_of :name, :username, :minimum => 3, :maximum => 50
  validates_length_of :email, :minimum => 5, :maximum => 50

  def age
    birthday_age
  end
end
