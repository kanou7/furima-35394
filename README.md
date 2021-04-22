# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| encrypted_password         | string | null: false |
| encrypted_password_confirm | string | null: false |
| name                       | string | null: false |
| name_kana                  | string | null: false |
| birth                      | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| price      | string     | null: false                    |
| category   | text       | null: false                    |
| status     | text       | null: false                    |
| deli_price | string     | null: false                    |
| area       | text       | null: false                    |
| deli_day   | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_num     | string     | null: false                    |
| limit        | string     | null: false                    |
| security     | string     | null: false                    |
| postal_code  | string     | null: false                    |
| municipality | text       | null: false                    |
| address      | string     | null: false                    |
| building     | text       | null: false                    |
| phone_num    | string     | null: false                    |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
