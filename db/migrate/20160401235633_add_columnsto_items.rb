class AddColumnstoItems < ActiveRecord::Migration
  def change
    add_column :items, :item_name, :string
    add_column :items, :store, :string
  end
end
