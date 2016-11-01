class Journalist < ApplicationRecord
  has_many :keyword_counts
  has_many :keywords, through: :keyword_counts
  has_many :articles

  validates :first_name, uniqueness: { scope: :last_name }

  def name
    "#{first_name} #{last_name}"
  end
end
