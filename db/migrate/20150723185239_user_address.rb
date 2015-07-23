class UserAddress < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :address_id
      t.integer :user_id
    end

  end
end
