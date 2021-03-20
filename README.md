<!-- アソシエーションを書くこと・ER図で書かれているカラムを全て網羅すること -->
# テーブル設計

## users テーブル

| Column   　　　　　　　　| Type   | Options     |
| --------　　　　　 　　　| ------ | ----------- |
| nicname 　　　　　　　　　| string | null: false |
| email　　　　　　　　　　　| string | null: false |
| encrypted_password　　　| string | null: false |
| name_firstname　　　　　| string | null: false |
|name_lastname　　　　    | string | null: false |
| name_firstname_kana　　| string | null: false  |   
| name_lastname_kana
| birth_day　　　　　　　　| data| null: false |

### Association
- has_many :room_users
 has_many :rooms, through: item_users

## items テーブル

| Column　　　　 　  | Type   | Options    |
| ------　　　　    | ------ | -----------|
| item_name　　　   | string | null: false|
| category_id　　　　| integer | null: false|
| sales_status_id　| integer| null: false|
| delivery_fee_id　| integer | null: false|
| prefecture_id　　  | integer | null: false|
| delivery_date_id　| integer | null: false|
| price  　　　　　　 | integer | null: false|

### Association
has_many :item_users
- has_many :users, through: item_users

## purchasebox テーブル

| Column        | Type       | Options|
| ------        | ---------- | -------|
| postal_code   |string | null: false |
||prefecture_id  |integer| null: false |
|city           |string | null: false |
|address        |string | null: false |
|building       |string | null: false |
|tel_number     |string | null: false |

### Association

- belongs_to :purchasebox
- belongs_to :user


## sold-out テーブル

| Column  | Type       | Options |
| ------- | ---------- | -------|
| item_id |integer | null: false |
| user_id |integer | null: false |

### Association

- belongs_to :sold-out
- belongs_to :user