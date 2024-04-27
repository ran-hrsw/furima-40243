# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false,unique: true  |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

* has_many :items
* has_many :buying_histories

## addresses table

| Column              | Type               | Options                        |
|---------------------|--------------------|--------------------------------|
| buying_history      | references         | null: false, foreign_key: true |
| post_code           | string             | null: false                    |
| city                | string             | null: false                    |
| address_id          | integer            | null: false                    |
| number              | string             | null: false                    |
| building_name       | string             |                                |
| phone_number        | string             | null: false                    |


### Association

* belongs_to :buying_history

## items table

| Column              | Type                | Options                            |
|---------------------|---------------------|------------------------------------|
| user                | references          | null: false, foreign_key: true     |
| price               | integer             | null: false                        |
| item_name           | string              | null: false                        |
| item_description    | text                | null: false                        |
| category_id         | integer             | null: false                        |
| status_id           | integer             | null: false                        |
| cost_id             | integer             | null: false                        |
| address_id          | integer             | null: false                        |
| transit_time_id     | integer             | null: false                        |

### Association

* belongs_to :user
* has_one :buying_history

## Buying_histories table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| user                | references          | null: false, foreign_key: true |
| item                | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :address


