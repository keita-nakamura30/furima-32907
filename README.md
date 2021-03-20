<!-- アソシエーションを書くこと・ER図で書かれているカラムを全て網羅すること -->
# テーブル設計

## users テーブル

| Column   　　　　　　　　| Type   | Options     |
| --------　　　　　 　　　| ------ | ----------- |
| nicname 　　　　　　　　　| string | null: false |
| email　　　　　　　　　　　| string | null: false 　unique:true|
| encrypted_password　　　| string | null: false |
| name_firstname　　　　　| string | null: false |
| name_lastname　　　　    | string | null: false |
| name_firstname_kana　　| string | null: false  |   
| name_lastname_kana     | string | null: false  |
| birth_day　　　　　　　 　| date| null: false |

### Association
- has_many :items　
- has_many :purchasebox

## items テーブル

| Column　　　　 　  | Type   | Options    |
| ------　　　　    | ------ | -----------|
| item_name　　　   | string | null: false|
| item_info        | text   | null: false|
| category_id　　　　| integer | null: false|
| sales_status_id　| integer| null: false|
| delivery_fee_id　| integer | null: false|
| prefecture_id　　  | integer | null: false|
| delivery_date_id　| integer | null: false|
| price  　　　　　　 | integer | null: false|
| user          |references | null: false |

### Association
belongs_to :user
has_one    :sold_out
## purchaseboxs テーブル

| Column        | Type       | Options|
| ------        | ---------- | -------|
| postal_code   |string | null: false |
| prefecture_id  |integer| null: false |
| city           |string | null: false |
| address        |string | null: false |
| building       |string | 
| tel_number     |string | null: false |
| sold_out       |references | null: false |
### Association

-belongs_to :sold_out



## sold_outs テーブル

| Column  | Type       | Options |
| ------- | ---------- | -------|
| item |references | null: false |
| user |references | null: false |

### Association

-belongs_to :user
-belongs_to :item
-has_one    :purchasebox
