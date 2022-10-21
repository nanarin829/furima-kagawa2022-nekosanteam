class AddPerfectureIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :perfecture_id, :integer
  end
end
