class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.string      :post_code,            null: false
      t.integer     :pref_id,              null: false
      t.string      :city,                 null: false
      t.string      :address,              null: false
      t.string      :building
      t.string      :tel,                  null: false
      t.references  :item_user,            null: false,foreign_key: true

      t.timestamps
    end
  end
end
