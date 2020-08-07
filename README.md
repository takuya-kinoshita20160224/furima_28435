# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| family_name | string | null: false |
| last_name   | string | null: false |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| item_name    | string     | null: false                    |
| text         | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : buy

## buy テーブル

| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :infomation

## infomation テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| address       | string     | null: false                    |
| post_code     | integer    | null: false                    |
| city          | string     | null: false                    |
| house_name    | string     |                                |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy