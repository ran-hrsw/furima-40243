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
* has_one :address
* has_one :buying history

## address table

| Column              | Type               | Options                   |
|---------------------|--------------------|---------------------------|
| user                | references         | foreign_key: true         |
| history             | string             | null: false               |
| post_code           | string             | null: false               |
| prefecture          | string             | null: false               |
| city                | string             | null: false               |
| address             | string             | null: false               |
| building_name       | string             |                           |
| phone_number        | string             | null: false               |


### Association

* belongs_to :user

## items table

| Column              | Type                | Options                  |
|---------------------|---------------------|--------------------------|
| price               | integer             | null: false              |
| items_name          | string              | null: false              |
| name                | string              | null: false              |
| category            | string              | null: false              |
| status              | string              | null: false              |
| cost                | string              | null: false              |
| address             | string              | null: false              |
| days                | string              | null: false              |

### Association

* belongs_to :user

## Buying history table

| Column              | Type                | Options                        |
|---------------------|---------------------|--------------------------------|
| customer            | string              | null: false, foreign_key: true |
| items               | string              | null: false, foreign_key: true |

### Association

* belongs_to :user


