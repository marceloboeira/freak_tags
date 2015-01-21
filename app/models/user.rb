class User < ActiveRecord::Base
  include Amistad::FriendModel

  acts_as_birthday :birthday
  has_enumeration_for :gender, :with => Gender, :create_helpers => true

  before_validation :downcase_email

  validates :name, presence: true, length: { in: 2..50 }
  validates :username, presence: true, uniqueness: {:case_sensitive => false}, username: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: {:case_sensitive => false}, email: true, length: { in: 5..50 }
  validates :gender, presence: true
  validates :birthday, allow_blank: true, date: { after: 100.years.ago,
                                                  before: 01.years.ago }
  validates :description, length: { maximum: 500 }


  def age
    birthday_age
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end


end
