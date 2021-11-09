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
| birthday           | date   | null: false              |　 
### Association

- has_many :records
- has_many :products

## destinations テーブル

 Column              | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| post_code          | string | null: false                    |
| prefecture_id      | integer| null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building_name      | string |                                |　 
| phone_number       | string | null: false                    | 
| record             |references| null: false, foreign_key: true |  
### Association

- belongs_to :record

## products テーブル

Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| price              | integer| null: false,                   |
| description        | text   | null: false,                   |
| status_id          | integer| null: false,                   | 
| shipping_cost_id   | integer| null: false,                   |
| shipping_days_id   | integer| null: false,                   |
| prefecture_id      | integer| null: false,                   |
| category_id        | integer| null: false,  foreign_key: true|　
| user               |references| null: false,  foreign_key: true|　
 product_name         string  

### Association

- belongs_to :user
- has_one : record

## records テーブル
Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| user               | references| null: false, foreign_key: true|
| product            | references| null: false, foreign_key: true|

### Association

- has_one : destination
- belong_to : user
- belong_to : product





 c