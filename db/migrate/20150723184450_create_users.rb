class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :unique => true, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :phone
      t.integer :primary_address_id

      t.timestamps null: false
    end
  end
end
