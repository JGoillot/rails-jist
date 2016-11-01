class KeywordCount < ApplicationRecord
  belongs_to :journalist
  belongs_to :keyword

  validates :journalist, uniqueness: { scope: :keyword }
end
