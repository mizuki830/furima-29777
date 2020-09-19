# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday　　　    | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :shoppings

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explain         | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shopping_change | integer    | null: false                    |
| current_place   | integer    | null: false                    |
| send_day        | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :shopping

## shoppings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_number   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| build_name    | string  |             |
| phone_number  | string  | null: false |
| shopping      | references | null: false, foreign_key: true |

### Association

- belongs_to :shopping

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item