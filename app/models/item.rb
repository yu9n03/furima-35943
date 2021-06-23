class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :charge_rate, :status, :prefecture, :until_send

  with_options presence: true do
    validates :name, :text, :image
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :charge_rate_id, :status_id, :prefecture_id, :until_send_id
  end
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end