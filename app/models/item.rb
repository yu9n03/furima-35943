class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :charge_rate, :status, :prefecture, :until_send

  with_options presence: true do
    validates :name, :text, :image
  end
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :charge_rate_id, :status_id, :prefecture_id, :until_send_id
  end
  validates :price, 
            presence: true, 
            numericality: { message: 'is invalid. Input half-width characters'},
            inclusion: { in: 300..9999999, message: "is out of setting range"}
end