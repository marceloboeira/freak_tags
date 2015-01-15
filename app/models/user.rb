class User < ActiveRecord::Base

  acts_as_birthday :birthday
  has_enumeration_for :sex, :with => Sex, :create_helpers => true


  validates :name, presence: true, length: { in: 3..30 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :email, presence: true, uniqueness: true, length: { in: 5..30 }
  validates :sex, presence: true
  validates :description, length: { maximum: 500 }


  def age
    birthday_age
  end
end
