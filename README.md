# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| last_kana  | string  | null: false |
| first_kana | string  | null: false |
| birthday   | integer | null: false |


### Association

- has_many :items_sells
- has_many :items_buys

## items_sells テーブル

| Column        | Type   | Options           |
| ------------- | ------ | ----------------- |
| image         | image  | Active Storage??? |
| item_name     | string | null: false       |
| item_describe | string | null: false       |
| category      | string | null: false       |
| condition     | string | null: false       |
| shipping_fee  | string | null: false       |
| ship_from     | string | null: false       |
| delivery_day  | string | null: false       |
| price         | string | null: false       |
| user          | string | foreign_key: true |

### Association

- has_one : items_buy
- belongs_to :user

## items_buys テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| items_sell | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :items_sell
- has_one :address

## address テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | integer    | null: false,      |
| prefecture     | string     | null: false,      |
| municipalities | string     | null: false,      |
| block_number   | string     | null: false,      |
| building_name  | string     |                   |
| phone_number   | integer    | null: false,      |
| items_buy      | references | foreign_key: true |


### Association

- belongs_to :items_buy