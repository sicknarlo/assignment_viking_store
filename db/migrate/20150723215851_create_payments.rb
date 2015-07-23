class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :cc_number
      t.string :name_on_cc
      t.string :exp_date
      t.integer :user_id
      t.integer :billing_addrordeess
    end
  end
end
