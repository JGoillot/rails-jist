class Keyword < ApplicationRecord
  has_many :journalist_keywords
  has_many :journalists, through: :journalist_keywords

  validates :keywords, uniqueness: true
end
