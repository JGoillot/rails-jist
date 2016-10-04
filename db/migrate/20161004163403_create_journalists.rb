class CreateJournalists < ActiveRecord::Migration[5.0]
  def change
    create_table :journalists do |t|
      t.string :first_name
      t.string :last_name
      t.string :twitter_user_name
      t.string :email
      t.string :phone
      t.string :company

      t.timestamps
    end
  end
end
