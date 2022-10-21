class Address < ApplicationRecord

  belongs_to :order

  # validates :post_code , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city , presence: true 
  validates :address , presence: true 
  validates :phone_num , presence: true
  validates :phone_num , format: {with: /\A\d{10,11}\z/ }

end
