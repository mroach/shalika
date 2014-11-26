class Cms::Page < ActiveRecord::Base
  extend FriendlyId
  audited

  belongs_to :category

  friendly_id :title, use: [:slugged, :history]

  after_initialize :defaults

  def defaults
    self.published_at ||= Time.now.utc
  end
end
