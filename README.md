###### tags: `高松コーディングブートキャンプ-チーム開発-nekosann-team`

# テーブル設計

## users テーブル
| Column             | Type   | options                |
| ------------------ | ------ | ---------------------- |
| email              | string | null:false, default:"" |
| encrypted_password | string | null:false, default:"" |
| nickname           | string | null:false             |
| last_name          | string | null:false             |
| first_name         | string | null:false             |
| last_name_kana     | string | null:false             |
| first_name_kana    | string | null:false             |
| birth_year         | string | null:false             |
| birth_month        | string | null:false             |
| birth_day          | string | null:false             |

### Assoasiation
* has_many:exhibits dependent: :destroy
* has_many:deliver_adresses dependent: :destroy

### 備考
* last_name : 苗字
* first_name : 名前

## exhibits テーブル
| Column      | Type       | options                     |
| ----------- | ---------- | --------------------------- |
| name        | string     | null:false                  |
| description | text       | null:false                  |
| price       | string     | null:false                  |
| user_id     | references | null:false,foreign_key:true | 

### Assoasiation
* belongs_to:user
* has_many:deliver_addresses dependent: :destroy
* has_one_attached:image

### 備考
* 画像はActiveStorageで実装
* 商品の詳細-カテゴリはActiveHashで実装
* 商品の詳細-商品の状態はActiveHashで実装
* 配送について-配送料の負担はActiveHashで実装
* 配送について-配送元の地域はActiveHashで実装
* 配送について-配送までの日数はActiveHashで実装
* exhibit(英訳:出品)

## deliver_addresses テーブル
| Column     | Type       | options                     |
| ---------- | ---------- | --------------------------- |
| post_code  | string     | null:false                  |
| city       | string     | null:false                  |
| address1   | string     | null:false                  |
| address2   | string     |                             |
| phone_num  | string     | null:false                  |
| user_id    | references | null:false,foreign_key:true |
| exhibit_id | references | null:false,foreign_key:true |

### Assoasiation
* belongs_to:user,exhibit

### 備考
* 都道府県はActveHashで実装

</br>

## 備考

* カード情報
DBに保存しないのでテーブルは作らない