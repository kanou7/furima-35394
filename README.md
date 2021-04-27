# テーブル設計

## users テーブル

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| nickname                   | string | null: false               |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| family_name                | string | null: false               |
| first_name                 | string | null: false               |
| family_name_kana           | string | null: false               |
| first_name_kana            | string | null: false               |
| birth                      | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| price         | integer    | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| deli_price_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| deli_day_id   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_num    | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase