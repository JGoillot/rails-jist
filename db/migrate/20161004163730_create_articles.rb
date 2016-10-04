class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.date :writed_at
      t.references :journalist, foreign_key: true

      t.timestamps
    end
  end
end
