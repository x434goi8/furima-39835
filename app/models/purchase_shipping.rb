class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city_or_district, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_or_district
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id.to_i, user_id:)
    ShippingDetail.create(postal_code:, prefecture_id:, city_or_district:,
                          street_address:, building_name:, phone_number:, purchase_id: purchase.id)
  end
end
