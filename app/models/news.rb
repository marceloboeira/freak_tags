class News < ActiveRecord::Base

  belongs_to :author, :class_name => "User"

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: {case_sensitive: false}
  validates :slug_line, presence: true
  validates :content, presence: true
  validates :author, presence: true

  has_enumeration_for :state, :create_helpers => true, :create_scopes => true, :required => true
end
