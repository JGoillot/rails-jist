class PersonalList < ApplicationRecord
  belongs_to :user
  belongs_to :journalist
end
