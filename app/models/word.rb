class Word < ApplicationRecord
  validates_presence_of :spelling, :length
end
