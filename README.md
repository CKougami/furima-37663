# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| berth_yy           | date   | null: false |
| berth_mm           | date   | null: false |
| berth_dd           | date   | null: false |

### Association
- has_many :items
- has_one  :address

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
| seller          | references | null: false, foreign_key: true |
| buyer           | references | null: false, foreign_key: true |

### Association
- belongs_to :users