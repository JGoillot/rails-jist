class JournalistKeyword < ApplicationRecord
  belongs_to :journalist
  belongs_to :keyword
end
