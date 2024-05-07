## users テーブル

| Column             | Type   |Options     |
| ------------------ | ------ |----------- |
| name               | string | null:false |
| email              | string | null:false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

has_many :items
has_many :purchase_records

## items テーブル

| Column             | Type   |Options     |
| ------------------ | ------ |----------- |
| image              | string | null: false |
| name               | string | null: false |
| item_details       | text   | null: false |
| category           | string | null: false |
| state              | string | null: false |
| price              | integer | null: false |
| user_id            | references | null: false ,foreign_key: true|
| postage            | integer | null: false |
| region             | integer | null: false |
| shipping_date      | integer | null: false |

### Association

belongs_to :user
has_one :purchase_record

## purchase_records テーブル

| Column             | Type   |Options     |
| ------------------ | ------ |----------- |
| telephone_number   | string | null: false, unique: true |
| user_id            | references | null: false ,foreign_key: true|
| item_id            | references | null: false ,foreign_key: true|

### Association

belongs_to :user
belongs_to :address

## addresses テーブル

| Column             | Type   |Options     |
| ------------------ | ------ |----------- |
| post_code          | integer | null: false |
| prefecture         | string  | null: false |
| municipality       | string  | null: false |
| house_number       | string  | null: false |
| building_name      | string  |  |

### Association

belongs_to :purchase_record
