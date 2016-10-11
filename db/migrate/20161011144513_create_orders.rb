class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :state
      t.monetize :amount
      t.json :payment
      t.monetize :amount, currency: { present: false }

      t.timestamps
    end
  end
end
