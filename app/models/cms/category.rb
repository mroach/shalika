class Cms::Category < ActiveRecord::Base
  extend FriendlyId
  audited

  has_many :pages

  friendly_id :title, use: [:slugged, :history]
end
