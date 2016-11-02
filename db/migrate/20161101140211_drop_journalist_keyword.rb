class DropJournalistKeyword < ActiveRecord::Migration[5.0]
  def change
    drop_table :journalist_keywords
  end
end
