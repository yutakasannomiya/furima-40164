class CreateFusions < ActiveRecord::Migration[7.0]
  def change
    create_table :fusions do |t|

      t.timestamps
    end
  end
end
