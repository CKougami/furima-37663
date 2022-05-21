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
- has_one  :credit_cards
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
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :categories
- belongs_to :item_condition
- belongs_to :postage_payer
- belongs_to :shipping_area
- belongs_to :preparation_day

## categories
| Column     | Type   | Options     |
| ---------- | ------ | ------------|
| name       | string | null: false |

### Association
- has_many   :items

## item_conditions
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| item_condition | string | null: false |

### Association
- has_many   :items

## postage_payers
| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postage_payer | string | null: false |

### Association
- has_many   :items

## shipping_areas
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| shipping_area  | string | null: false |

### Association
- has_many   :items

## preparation_days
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| preparation_day | string | null: false |

### Association
- has_many   :items