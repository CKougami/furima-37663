FactoryBot.define do
  factory :item do
    item_name           {'商品名'}
    introduction        {'商品説明'}
    category_id         {'2'}
    item_condition_id   {'2'}
    postage_payer_id    {'2'}
    shipping_area_id    {'2'}
    preparation_day_id  {'2'}
    price               {'10000'}

    association :user   # userとitemを紐づける

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    # public/imagesにあるtest_image.pngを[test_image.png]というダミー名前で添付
    # ioクラス = 基本的な入出力機能のためのクラス
  end
end
