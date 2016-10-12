class AddPriceToPlans < ActiveRecord::Migration[5.0]
  def change
    add_monetize :plans, :price, currency: { present: false }
  end
end
