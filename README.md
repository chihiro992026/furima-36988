# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| nickname           | string | null: false              | 
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |　 
### Association

- has_many :record
- has_many :destination
- has_many :products

## destination テーブル

 Column              | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| post_code          | string | null: false                    |
| prefecture         | string | null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building_name      | string |                                |　 
| phone_number       | string | null: false                    | 
| purchase history   |reference| null: false, foreign_key: true |  
### Association

- belongs_to :users

## products テーブル

Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| price              | string | null: false,                   |
| description        | text   | null: false,                   |
| status             | string | null: false,                   | 
| shipping_cost      | string | null: false,                   |
| shipping_days      | string | null: false,                   |
| prefecture_id      | string | null: false,                   |
| category_id        | integer| null: false,  foreign_key: true|　
| user_id            |reference| null: false,  foreign_key: true|　


### Association

- belongs_to :users 
- belongs_to :users, record 

## record テーブル
Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| name               | string | null: false,                   |
| ancestry           | string | null: false,                   |

### Association

- has_one : destination
- belong_to : users
- belong_to : products