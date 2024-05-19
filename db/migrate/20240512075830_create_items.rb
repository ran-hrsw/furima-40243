class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.references     :user,               null: false, foreign_key: true
      t.integer        :price,              null: false
      t.string         :item_name,          null: false
      t.text           :item_description,   null: false
      t.integer        :category_id,        null: false
      t.integer        :status_id,          null: false
      t.integer        :cost_id,            null: false
      t.integer        :address_id,         null: false
      t.integer        :transit_time_id,    null: false
    end
  end
end
