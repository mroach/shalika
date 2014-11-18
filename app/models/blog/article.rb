class Blog::Article < ActiveRecord::Base
  extend FriendlyId
  audited

  friendly_id :raw_slug, use: [:slugged, :history]
  default_scope { order('published_at DESC') }
  after_initialize :defaults

  def defaults
    self.published_at ||= Time.now.utc
  end

  def raw_slug
    "#{published_at.strftime('%Y-%m-%d')} #{title}"
  end

  def should_generate_new_friendly_id?
    super || title_changed? || published_at_changed?
  end
end
