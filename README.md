# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :item_users

## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| item_name        | string     | null: false                   |
| item_text        | text       | null: false                   |
| item_category    | integer    | null: false, ActiveHash       |
| item_condition   | integer    | null: false, ActiveHash       |
| item_shipping    | integer    | null: false, ActiveHash       |
| item_pref        | integer    | null: false, ActiveHash       |
| item_days        | integer    | null: false, ActiveHash       |
| item_price       | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|

- belongs_to :user
- has_many   :item_users



## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one    :buy
- belongs_to :item
- belongs_to :user

## buys テーブル

| Column           | Type       | Options                 |
| ---------------- | ---------- | ----------------------- |
| post_code        | integer    | null: false             |
| pref             | integer    | null: false, ActiveHash |
| city             | string     | null: false             |
| address          | string     | null: false             |
| building         | string     | null: false             |
| tel              | integer    | null: false             |

### Association
- belongs_to :item_users
