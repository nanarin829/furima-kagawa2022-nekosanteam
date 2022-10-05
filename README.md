# テーブル設計

## users テーブル
| Column             | Type   | options                                   |
| ------------------ | ------ | ----------------------------------------- |
| email              | string | null:false, default:"" , uniqueness: true |
| encrypted_password | string | null:false, default:""                    |
| nickname           | string | null:false                                |
| last_name          | string | null:false                                |
| first_name         | string | null:false                                |
| last_name_kana     | string | null:false                                |
| first_name_kana    | string | null:false                                |
| birth_day          | date   | null:false                                |

### Association
* has_many:items dependent: :destroy
* has_many:orders

### 備考
* last_name : 苗字
* first_name : 名前



## items テーブル
| Column         | Type       | options                     |
| -------------- | ---------- | --------------------------- |
| name           | string     | null:false                  |
| description    | text       | null:false                  |
| price          | integer    | null:false                  |
| user           | references | null:false,foreign_key:true | 
| category_id    | integer    | null:false                  | 
| state_id       | integer    | null:false                  | 
| burden_id      | integer    | null:false                  | 
| prefecture_id  | integer    | null:false                  | 
| workday_id     | integer    | null:false                  | 


### Association
* belongs_to:user
* belongs_to:order
* has_one_attached:image


### 備考
* 画像はActiveStorageで実装
* 商品の詳細-カテゴリはActiveHashで実装
* 商品の詳細-商品の状態はActiveHashで実装
* 配送について-配送料の負担はActiveHashで実装
* 配送について-配送元の地域はActiveHashで実装
* 配送について-配送までの日数はActiveHashで実装
* category(カテゴリー)
* state(商品の状態)
* burden(負担)
* area(地域)
* workdays(日数)


## addresses テーブル
| Column        | Type       | options                     |
| ------------- | ---------- | --------------------------- |
| post_code     | string     | null:false                  |
| city          | string     | null:false                  |
| address1      | string     | null:false                  |
| address2      | string     |                             |
| phone_num     | integer    | null:false                  |
| prefecture_id | integer    | null:false                  |
| order         | references | null:false,foreign_key:true | 

### Association
* belongs_to:order


### 備考
* 都道府県はActiveHashで実装
* prefecture(都道府県)


## orders テーブル
| Column      | Type       | options                     |
| ----------- | ---------- | --------------------------- |
| user        | references | null:false,foreign_key:true | 
| item        | references | null:false,foreign_key:true | 

### Association
* belongs_to:user
* belongs_to:item
* belongs_to:address

## 備考

* カード情報
DBに保存しないのでテーブルは作らない