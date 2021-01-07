# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique :true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_kana          | string  | null: false               |
| first_kana         | string  | null: false               |
| date               | date    | null: false               |


### Association

- has_many :items
- has_many :items_buys

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| describe         | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| shipping_fee_id  | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- has_one : items_buy
- belongs_to :user

## items_buys テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false,      |
| prefecture_id  | integer    | null: false,      |
| municipalities | string     | null: false,      |
| block_number   | string     | null: false,      |
| building_name  | string     |                   |
| phone_number   | string     | null: false,      |
| items_buy      | references | foreign_key: true |


### Association

- belongs_to :items_buy