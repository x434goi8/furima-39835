# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| Full Name               | string | null: false |
| Full Name Kana          | string | null: false |
| Date of Birth           | data   | null: false |

### Association

- has_many :products
- has_one :purchases

## products テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| user                        | references | null: false, foreign_key: true |
| Image                       | string     | null: false                    |
| Product Name                | string     | null: false                    |
| Product Description         | text       | null: false                    |
| Category                    | string     | null: false                    |
| Condition                   | string     | null: false                    |
| Shipping Fee Responsibility | string     | null: false                    |
| Shipping Origin Region      | string     | null: false                    |
| Shipping Duration           | integer    | null: false                    |
| Price                       | decimal    | null: false                    |


### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |
| Card Number        | string     | null: false                    |
| Expiration Date    | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| Security Code      | string     | null: false                    |
| Postal Code        | string     | null: false                    |
| City or District   | string     | null: false                    |
| Street Address     | string     | null: false                    |
| Building Name      | string     | null: false                    |
| Phone Number)      | string     | null: false                    |

### Association

- has_one :users
- has_one :products
