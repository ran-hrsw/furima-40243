class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :buying_histories

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合での入力が必須です' }
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birth_day, presence: true
end
