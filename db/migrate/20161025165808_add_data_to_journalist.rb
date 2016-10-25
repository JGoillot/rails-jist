class AddDataToJournalist < ActiveRecord::Migration[5.0]
  def change
    add_column :journalists, :photo_url, :string
    add_column :journalists, :biography, :text
  end
end
