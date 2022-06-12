FactoryBot.define do
  factory :purchase_address do
    postal_code               { '329-0433' }
    shipping_area_id          { '2' }
    city                      { '札幌市' }
    address                   { '東区北49条東13丁目' }
    building_name             { 'ハイム栄' }
    tel                       { '0801234567' }
    user_id                   { '1' }
    item_id                   { '1' }
    token                     { 'tok_abcdefghik00000000000000000' }
  end
end
