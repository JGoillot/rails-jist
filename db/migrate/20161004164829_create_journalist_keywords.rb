class CreateJournalistKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :journalist_keywords do |t|
      t.references :journalist, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
