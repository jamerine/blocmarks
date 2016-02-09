class Bookmark < ActiveRecord::Base

  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  before_save :format_url
  validates :url, :presence => true
  default_scope { order('created_at DESC') }


  private

  def format_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end
end
