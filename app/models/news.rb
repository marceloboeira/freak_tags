class News < ActiveRecord::Base
  include FriendlyId
  include PublicActivity::Model
  tracked only: [:create], owner: :author

  acts_as_paranoid
  friendly_id :title

  belongs_to :author, class_name: "User"

  validates :title, presence: true, length: { in: 5..150 }
  validates :slug_line, presence: true, length: { in: 20..150 }
  validates :content, presence: true, length: { in: 1..100000 }
  validates :author, presence: true

  private

  def should_generate_new_friendly_id?
    title_changed?
  end

end
