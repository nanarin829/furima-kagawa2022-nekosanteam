class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :building, :phone_num, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 誰が何を買ったか保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    Address.create(post_code: post_code, city: city, address: address, building: building, phone_num: phone_num, prefecture_id: prefecture_id, order_id: order_id)
  end
end