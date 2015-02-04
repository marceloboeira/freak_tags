class User < ActiveRecord::Base
  include Amistad::FriendModel

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, :authentication_keys => [:login]
  acts_as_birthday :birthday
  has_enumeration_for :gender, :with => Gender, :create_helpers => true
  has_enumeration_for :role, :with => Role, :create_helpers => true

  before_validation :normalize_values, :default_values

  validates :name, presence: true, length: { in: 2..50 }, full_name: true
  validates :username, presence: true, uniqueness: {case_sensitive: false}, username: true, length: { in: 2..50 }
  validates :password, presence: true, on: :update, allow_blank: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true, length: { in: 5..50 }
  validates :gender, presence: true
  validates :role, presence: true
  validates :birthday, allow_blank: true, date: { after: 100.years.ago, before: 01.years.ago }
  validates :description, length: { maximum: 500 }

  attr_accessor :login

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

  # 48 - Devise: e-mail or username to sign-in
  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:login]) || find_by(email: conditions[:login])
  end
end
