class Analysis < ActiveRecord::Base
  require 'base62'

  validates :url, presence: true
  validates :url, url: true
  after_create :set_shortened_url

  def to_param
    shortened_url
  end

  private

  def set_shortened_url
    update_attribute(:shortened_url, self.id.base62_encode)
  end
end
