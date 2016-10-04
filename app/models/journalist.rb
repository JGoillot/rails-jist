class Journalist < ApplicationRecord
  has_many :journalist_keywords
  has_many :keywords, through: :journalist_keywords
  has_many :articles

  validates :first_name, uniqueness: { scope: :last_name }

end
