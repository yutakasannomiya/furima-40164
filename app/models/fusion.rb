class Fusion
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :pref_id, :city, :address, :building, :tel, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :tel, format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid, Half-width number'}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :pref_id, numericality: { other_than: 1 }

  def save
    item_user = ItemUser.create(user_id: user_id, item_id: item_id)
    Buy.create(post_code: post_code, pref_id: pref_id, city: city, address: address, building: building, tel: tel, item_user: item_user)
  end
end
