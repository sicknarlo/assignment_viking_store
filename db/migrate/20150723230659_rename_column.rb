class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :payments, :billing_addrordeess, :billing_address_id
  end
end
