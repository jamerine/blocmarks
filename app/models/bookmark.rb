class Bookmark < ActiveRecord::Base
  belongs_to :topic
  before_save :format_url
  validates :url, :presence => true

  private

  def format_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end
end
