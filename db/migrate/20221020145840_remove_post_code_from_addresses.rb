class RemovePostCodeFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :status, :string
  end
end
