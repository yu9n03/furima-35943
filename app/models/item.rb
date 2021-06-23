class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :charge_rate_id, presence: true
  validates :status_id, presence: true
  validates :prefecture_id, presence: true
  validates :until_send_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :images, presence: true
