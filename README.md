# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| berth_yy           | date   | null: false               |
| berth_mm           | date   | null: false               |
| berth_dd           | date   | null: false               |

### Association
- has_many :items
- has_many :trading_dates

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_image      | string     | null: false                    |
| item_name       | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| item_condition  | integer    | null: false                    |
| postage_payer   | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shipping_address
- belongs_to :trading_date

## shipping_address テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| tel             | string     | null: false                    |

### Association
- belongs_to :user
- has_many   :items
- has_many   :trading_date

## trading_dates テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many   :items