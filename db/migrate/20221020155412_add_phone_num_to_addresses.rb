class AddPhoneNumToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :phone_num, :string
  end
end
