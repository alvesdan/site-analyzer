class Analysis < ActiveRecord::Base
  require 'base62'

  validates :url, presence: true
  validates :url, url: true
  after_create :set_shortened_url
  before_validation :normalize_url

  def to_param
    shortened_url
  end

  def normalize_url
    self.url = url.gsub(/\/\z/, '') if url.present?
  end

  private

  def set_shortened_url
    update_attribute(:shortened_url, self.id.base62_encode)
  end
end
