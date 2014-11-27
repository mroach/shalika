class Cms::Page < ActiveRecord::Base
  extend FriendlyId
  audited

  belongs_to :category

  validates_presence_of :name

  friendly_id :name, use: [:slugged, :history]

  after_initialize :defaults

  def defaults
    self.published_at ||= Time.now.utc
  end
end
