class CreateKeywordCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_counts do |t|
      t.references :journalist, foreign_key: true
      t.references :keyword, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
