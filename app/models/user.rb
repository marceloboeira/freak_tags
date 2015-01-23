class User < ActiveRecord::Base
  include Amistad::FriendModel

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  acts_as_birthday :birthday
  has_enumeration_for :gender, :with => Gender, :create_helpers => true
  has_enumeration_for :role, :with => Role, :create_helpers => true

  before_validation :normalize_values, :default_values

  validates :name, presence: true, length: { in: 2..50 }
  validates :username, presence: true, uniqueness: {case_sensitive: false}, username: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true, length: { in: 5..50 }
  validates :gender, presence: true
  validates :role, presence: true
  validates :birthday, allow_blank: true, date: { after: 100.years.ago, before: 01.years.ago }
  validates :description, length: { maximum: 500 }

  def age
    birthday_age
  end

  private

  def normalize_values
    self.email = self.email.downcase if self.email.present?
  end

  def default_values
    self.name ||= self.username
    self.gender ||= Gender::OTHER
    self.role ||= Role::REGULAR
  end

end
