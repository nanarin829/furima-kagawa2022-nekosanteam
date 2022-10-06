class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :name,          null:false
      t.text       :description,   null:false
      t.integer    :price,         null:false
      # t.references :user,          foreign_key: true
      t.integer    :category_id,   null:false
      t.integer    :state_id,      null:false 
      t.integer    :burden_id,     null:false
      t.integer    :prefecture_id, null:false
      t.integer    :workday_id,    null:false

    end
  end
end
