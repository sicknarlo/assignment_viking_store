class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_num_name, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false

      t.timestamps null: false
    end
  end
end
