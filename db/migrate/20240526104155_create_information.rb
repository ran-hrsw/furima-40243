class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.references      :buying_history,       null: false, foreign_key: true
      t.string          :phone_number,         null: false
      t.string          :post_code,            null: false
      t.string          :city,                 null: false
      t.string          :building_name
      t.integer         :address_id,           null: false
      t.string          :number,               null: false

      t.timestamps
    end
  end
end
