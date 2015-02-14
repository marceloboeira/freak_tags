require 'friendly_id'

class News < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: [:slugged, :finders]

  belongs_to :author, class_name: "User"

  validates :title, presence: true, length: { in: 5..150 }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }, length: { in: 5..150 }
  validates :slug_line, presence: true, length: { in: 20..150 }
  validates :content, presence: true, length: { in: 1..1000 }
  validates :author, presence: true

  has_enumeration_for :state, create_helpers: true, create_scopes: true, required: true
end
