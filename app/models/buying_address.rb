class BuyingAddress
  include ActiveModel::Model

  attr_accessor :post_code, :city, :address_id, :number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id, :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address_id
    validates :address_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :number
    validates :phone_number
    validates :phone_number, length: { in: 10..11 }
    validates :phone_number, format: { with: /\A\d+\z/, message: 'Half-width numbers only' }
  end

  def save
    # 購入履歴を保村し、変数Buying_historyに代入する
    buying_history = BuyingHistory.create(user_id:, item_id:)
    # 住所を保存する
    # addresses_idには、変数addressのidと指定する
    Information.create(buying_history:, post_code:, city:, address_id:, number:,
                       building_name:, phone_number:)
    # 学習メモ　VSCodeの新しい記述方法　[:,]
  end
end
