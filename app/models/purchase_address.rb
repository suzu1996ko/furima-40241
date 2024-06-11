class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number,
                :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :purchase_record_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, municipality: municipality, house_number: house_number, phone_number: phone_number, prefecture_id: prefecture_id, purchase_record_id: purchase_record.id)
  end
end
