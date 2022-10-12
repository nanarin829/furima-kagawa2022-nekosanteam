class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :burden
  # has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :workday_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
