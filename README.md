# テーブル設計

## users テーブル

<<<<<<< HEAD
<<<<<<< Updated upstream
Things you may want to cover:
=======
=======
>>>>>>> 3e98bfd5b34d020ce1e1c152912c585a88317bdb
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| family_name          | string | null: false |
| last_name            | string | null: false |
| family_name_phonetic | string | null: false |
| last_name_phonetic   | string | null: false |
| birthday             | date   | null: false |
<<<<<<< HEAD

### Association
>>>>>>> Stashed changes
=======
### Association
>>>>>>> 3e98bfd5b34d020ce1e1c152912c585a88317bdb

- has_many :items
- has_many :buys

## items テーブル

<<<<<<< HEAD
<<<<<<< Updated upstream
* Configuration
=======
=======
>>>>>>> 3e98bfd5b34d020ce1e1c152912c585a88317bdb
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
<<<<<<< HEAD

### Association
>>>>>>> Stashed changes
=======
### Association
>>>>>>> 3e98bfd5b34d020ce1e1c152912c585a88317bdb

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
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_name    | string     |                                |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy