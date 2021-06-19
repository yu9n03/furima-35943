# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_date         | string | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| name        | string      | null: false                    |
| text        | text        | null: false                    |
| category    | string      | null: false                    |
| charge_rate | string      | null: false                    |
| status      | string      | null: false                    |
| area        | string      | null: false                    |
| until_send  | string      | null: false                    |
| price       | integer     | null: false                    |
| user_id     | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :oder

## orders テーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user_id | references  | null: false, foreign_key: true |
| item_id | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル
  
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| order_id      | references | null: false, foreign_key: true |


### Association
- belongs_to :order