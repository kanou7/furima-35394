class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :deli_price_id
    validates :area_id
    validates :deli_day_id
  end
end
