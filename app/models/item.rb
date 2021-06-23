class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge_rate
  belongs_to :status
  belongs_to :prefecture
  belongs_to :until_send

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :charge_rate_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :until_send_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image, presence: true
end
