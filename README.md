# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| berth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :trading_dates

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| item_condition  | integer    | null: false                    |
| postage_payer   | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :trading_date

## shipping_address テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| trading_id      | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| shipping_area   | integer    | null: false                    |
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
| user            | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :items
- belong_to  :shipping_address