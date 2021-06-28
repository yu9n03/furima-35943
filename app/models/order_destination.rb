class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # order情報を保存し、変数oderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Destination.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
end