# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| nickname                | string | null: false              |
| email                   | string | null: false, unique:true |
| encrypted_password      | string | null: false              |
| last_name               | string | null: false              |
| first_name              | string | null: false              |
| last_name_kana          | string | null: false              |
| first_name_kana         | string | null: false              |
| date_of_birth           | date   | null: false              |

### Association

- has_many :products
- has_many :purchase_users

## products テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| user                           | references | null: false, foreign_key: true |
| product_name                   | string     | null: false                    |
| product_description            | text       | null: false                    |
| category_id                    | integer    | null: false                    |
| condition_id                   | integer    | null: false                    |
| shipping_fee_responsibility_id | integer    | null: false                    |
| prefecture_id                  | integer    | null: false                    |
| shipping_duration_id           | integer    | null: false                    |
| price                          | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :purchase_user

## purchases_users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping_detail


## shipping_details テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchases_user     | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city_or_district   | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- belongs_to :purchases_user