class RemovePhoneNumFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :phone_num, :string
  end
end
