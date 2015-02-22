class News < ActiveRecord::Base
  include FriendlyId

  friendly_id :title
  belongs_to :author, class_name: "User"

  acts_as_paranoid
  after_destroy :after_destroy
  after_restore :after_restore

  validates :title, presence: true, length: { in: 5..150 }
  validates :slug_line, presence: true, length: { in: 20..150 }
  validates :content, presence: true, length: { in: 1..1000 }
  validates :author, presence: true

  has_enumeration_for :state, create_helpers: true, create_scopes: true, required: true

  private

  def after_destroy
    deleted!
    save!
  end

  def after_restore
    inactive!
    save!
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
