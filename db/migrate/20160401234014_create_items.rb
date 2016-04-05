class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :shopping_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
