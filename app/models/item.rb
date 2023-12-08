class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :shipping, class_name: 'Shipping'
  belongs_to :pref, class_name: 'Pref'
  belongs_to :scheduled_day, class_name: 'ScheduledDay'

  has_one_attached :image

  validates :item_name, :item_text, :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :pref_id
    validates :scheduled_day_id
  end

  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
end
