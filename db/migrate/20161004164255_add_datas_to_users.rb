class AddDatasToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :title, :string
    add_column :users, :startup_name, :string
    add_column :users, :prenium, :boolean
  end
end
