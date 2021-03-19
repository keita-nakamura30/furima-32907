<!-- アソシエーションを書くこと・ER図で書かれているカラムを全て網羅すること -->
# テーブル設計

## users テーブル

| Column   　　　　　　　　| Type   | Options     |
| --------　　　　　 　　　| ------ | ----------- |
| nicname 　　　　　　　　　| string | null: false |
| email　　　　　　　　　　　| string | null: false |
| password　　　　　　　　　| string | null: false |
| encrypted_password　　　| string | null: false |
| name_fullwidth　　　　　| string | null: false |
| name_kana　　　　　　　　| string | null: false |
| birth_day　　　　　　　　| string | null: false |

## items テーブル

| Column　　　　 　  | Type   | Options    |
| ------　　　　    | ------ | -----------|
| item_name　　　   | string | null: false|
| category　　　　 　| string | null: false|
| sales_status　　　| string | null: false|
| delivery_fee　　　| string | null: false|
| prefecture　　 　 | string | null: false|
| delivery_date　　 | string | null: false|
| price  　　　　　　| string | null: false|

## purchasebox テーブル

| Column        | Type       | Options|
| ------        | ---------- | -------|
| postal_code   |string | null: false |
||prefecture    |string | null: false |
|city           |string | null: false |
|address        |string | null: false |
|building       |string | null: false |
|tel_number     |string | null: false |
## sold-out テーブル

| Column  | Type       | Options |
| ------- | ---------- | -------|
| item_id |string | null: false |
| user_id |string | null: false |