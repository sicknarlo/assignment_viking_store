class Product < ActiveRecord::Migration
  def change    
    create_table :products do |t|

      t.decimal  :price, precision: 6, scale: 2
      t.string   :name, :null => false
      t.string   :description
      t.integer  :category_id

      t.timestamps null: false
    end
  end
end
