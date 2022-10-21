class RemovePerfectureIdFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :perfecture_id, :integer
  end
end
