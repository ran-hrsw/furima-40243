# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true, index: true |
| user_password      | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_year         | integer             | null: false               |
| birth_month        | integer             | null: false               |
| birth_day          | integer             | null: false               |

### Association

* has_many :products
* has_one :customer
* has_one :buying history

## customer table

| Column              | Type               | Options                   |
|---------------------|--------------------|---------------------------|
| card_id             | string             | null: false               |
| card_date           | date               | null: false               |
| card_code           | date               | null: false               |
| history             | string             | null: false               |
| post_code           | string             | null: false               |
| prefecture          | string             | null: false               |
| city                | string             | null: false               |
| address             | string             | null: false               |
| building_name       | string             | null: false               |
| phone_number        | string             | null: false               |


### Association

* belongs_to :user

## products table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| product_image       | string              | null: false                    |
| price               | string              | null: false                    |
| product_name        | string              | null: false                    |
| name                | string              | null: false                    |
| category            | string              | null: false                    |
| status              | string              | null: false                    |
| cost                | string              | null: false                    |
| prefecture          | string              | null: false                    |
| days                | string              | null: false                    |

### Association

* belongs_to :user

## Buying history table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| customer            | string              | null: false                    |
| product             | string              | null: false                    |

### Association

* belongs_to :user
