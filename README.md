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
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :shoppings

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_explain    | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category        | integer    | null: false, foreign_key: true |
| condition       | integer    | null: false, foreign_key: true |
| shopping_change | integer    | null: false, foreign_key: true |
| current_place   | integer    | null: false, foreign_key: true |
| send_day        | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :shopping
- has_one :shopping_address

## shoppings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shopping_addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_number   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| build_name    | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item