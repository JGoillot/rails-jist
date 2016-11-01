class Journalist < ApplicationRecord
  has_many :journalist_keywords
  has_many :keywords, through: :journalist_keywords
  has_many :articles

  validates :first_name, uniqueness: { scope: :last_name }

  include AlgoliaSearch

  algoliasearch do
  end

  def name
    "#{first_name} #{last_name}"
  end
end
