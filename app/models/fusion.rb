class Fusion
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :pref_id, :city, :address, :building, :tel

  def save
    item_user = ItemUser.create(user_id: user_id, item_id: item_id)
    Buy.create(post_code: post_code, pref_id: pref_id, city: city, address: address, building: building, tel: tel)
  end
end
