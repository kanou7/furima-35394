class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures, :municipality, :address, :building, :phone_num, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_num, format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefectures: prefectures, municipality: municipality, address: address, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end