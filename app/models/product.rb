class Product < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping_fee_responsibility, presence: true
  validates :prefecture, presence: true
  validates :shipping_duration, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
