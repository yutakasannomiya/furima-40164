class ItemUser < ApplicationRecord
  has_one    :buy
  belongs_to :item
  belongs_to :user
end
