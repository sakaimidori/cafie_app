class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.integer :cafe_id, null: false
      t.string :menu_name, null: false
      t.integer :price

      t.timestamps
    end
  end
end
