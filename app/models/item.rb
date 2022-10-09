class Item < ApplicationRecord
  belongs_to:user
  has_one:order
  has_one_attached:image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :burden_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :workday_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end


