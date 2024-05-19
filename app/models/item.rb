class Item < ApplicationRecord
  belongs_to :user
  # has_one :buying_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :address
  belongs_to :transit_time

  # 空の投稿を保存できないようにする
  validates :image, :item_name, :item_description, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 9_999_999 }
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :cost_id, :address_id, :transit_time_id, numericality: { other_than: 1 }
end
