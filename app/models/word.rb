class Word < ApplicationRecord
  validates_presence_of :spelling, :length

  after_save :invalidate_cache
  after_destroy :invalidate_cache

  def invalidate_cache
    Rails.cache.delete "length_#{length}_words"
  end
end
