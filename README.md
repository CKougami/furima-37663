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
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| introduction       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| postage_payer_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## shipping_addresses テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| trading_date     | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tel              | string     | null: false                    |

### Association
- belongs_to :purchase

## purchases テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to  :item
- belongs_to  :user
- has_one     :shipping_address
