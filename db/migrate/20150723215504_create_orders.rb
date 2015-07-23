class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  :user_id
      t.integer  :address_id
      t.integer  :payment_id
    end
  end
end
