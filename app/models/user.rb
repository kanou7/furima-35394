class User < ApplicationRecord
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'カナ文字を使用してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birth
  end
end
