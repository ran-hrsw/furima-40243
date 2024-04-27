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
* has_one :addresses
* has_one :buying histories

## addresses table

| Column              | Type               | Options                        |
|---------------------|--------------------|--------------------------------|
| user                | references         | foreign_key: true              |
| buying_history      | reherences         | null: false, foreign_key: true |
| post_code           | string             | null: false                    |
| prefecture          | string             | null: false                    |
| city                | string             | null: false                    |
| address             | string             | null: false                    |
| building_name       | string             |                                |
| phone_number        | string             | null: false                    |


### Association

* belongs_to :user

## items table

| Column              | Type                | Options                  |
|---------------------|---------------------|--------------------------|
| user                | references          | foreign_key: true        |
| price               | integer             | null: false              |
| items_name          | string              | null: false              |
| name                | string              | null: false              |
| category            | string              | null: false              |
| status_id           | integer             | null: false              |
| cost_id             | integer             | null: false              |
| address_id          | integer             | null: false              |
| days_id             | integer             | null: false              |

### Association

* belongs_to :user

## Buying histories table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| user                | references          | null: false, foreign_key: true |
| items               | string              | null: false, foreign_key: true |

### Association

* belongs_to :user


