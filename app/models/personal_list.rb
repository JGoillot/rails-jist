class PersonalList < ApplicationRecord
  belongs_to :user
  belongs_to :journalist
  validates :user, uniqueness: { scope: :journalist }
end
