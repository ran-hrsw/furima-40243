# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false               |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

* has_many :items
* has_many :buying histories

## addresses table

| Column              | Type               | Options                        |
|---------------------|--------------------|--------------------------------|
| buying_history      | references         | null: false, foreign_key: true |
| post_code           | string             | null: false                    |
| city                | string             | null: false                    |
| address_id             | string             | null: false                    |
| building_name       | string             |                                |
| phone_number        | string             | null: false                    |


### Association

* belongs_to :user
* has_many :items
* has_one :buying histories

## items table

| Column              | Type                | Options                  |
|---------------------|---------------------|--------------------------|
| user                | references          | foreign_key: true        |
| price               | integer             | null: false              |
| items_name          | string              | null: false              |
| name                | string              | null: false              |
| category_id         | integer              | null: false              |
| status_id           | integer             | null: false              |
| cost_id             | integer             | null: false              |
| address_id          | integer             | null: false              |
| transit_time_id             | integer             | null: false              |

### Association

* belongs_to :user
* has_one :buying histories

## Buying histories table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| user                | references          | null: false, foreign_key: true |
| items               | string              | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_many :items
* has_one :addresses


