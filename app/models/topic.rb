class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, :presence => true

end
