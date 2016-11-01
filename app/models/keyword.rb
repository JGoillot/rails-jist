class Keyword < ApplicationRecord
  has_many :keyword_counts
  has_many :journalists, through: :keyword_counts

  validates :name, uniqueness: true
end
