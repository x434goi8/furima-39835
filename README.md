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
| date_of_birth           | data   | null: false              |

### Association

- has_many :product
- has_many :purchase_user

## products テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| user                        | references | null: false, foreign_key: true |
| image                       | string     | null: false                    |
| product_name                | string     | null: false                    |
| product_description         | text       | null: false                    |
| category                    | string     | null: false                    |
| condition                   | string     | null: false                    |
| shipping_fee_responsibility | string     | null: false                    |
| shipping_origin_region      | string     | null: false                    |
| shipping_duration           | integer    | null: false                    |
| price                       | decimal    | null: false                    |


### Association

- belongs_to :user
- has_many :purchase_user

## purchases_users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery_user


## shipping_details テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| purchases_user     | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| city_or_district   | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- has_one :delivery_user
