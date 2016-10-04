class CreatePersonalLists < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_lists do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :journalist, foreign_key: true

      t.timestamps
    end
  end
end
