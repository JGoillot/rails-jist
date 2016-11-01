class AddDefautCountToKeywordCounts < ActiveRecord::Migration[5.0]
  def change
    change_column :keyword_counts, :count, :integer, :default => 0
  end
end
