class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :category_id, :item_condition_id, :postage_payer_id, :shipping_area_id,
              :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" }
    # id [1:---]のままだとエラーにする
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  # プルダウンにする項目
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :shipping_area
  belongs_to :preparation_day

  has_one_attached :image
  belongs_to :user
  has_one :purchase
end

# 商品名が必須であること（40文字以内）
# 商品の説明が必須であること（1000文字以内）
# カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数の情報が必須であること
# 価格の情報が必須であること。
# 価格は、¥300~¥9,999,999の間のみ保存可能であること。
# 価格は半角数値のみ保存可能であること（integerで数値のみの設定にしてあるのでバリデーションは不要）。
# 商品画像を1枚つけることが必須であること。
