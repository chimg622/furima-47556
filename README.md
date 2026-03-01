#　テーブル設計


## usersテーブル
|Colum              |Type   |Options                    |
|-------------------|-------|---------------------------|
|email              |string |null: false, unique: true  |
|encrypted_password |string |null: false                |
|nickname           |string |null: false                |
|last_name          |string |null: false                |
|first_name         |string |null: false                |
|last_name_kana     |string |null: false                |
|first_name kana    |string |null: false                |

### Association
has_many :items
has_many :purchases


## itemsテーブル
|Colum              |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|name               |string     |null: false                    |
|info               |text       |null: false                    |
|price              |integer    |null: false                    |
|user               |references |null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## purchasesテーブル
|Colum        |Type       |Options                        |
|-------------|-----------|-------------------------------|
|card_number  |integer    |null: false                    |
|expiry_date  |integer    |null: false                    |
|card_cvc     |integer    |null: false                    |
|post_number  |integer    |null: false                    |
|city         |string     |null: false                    |
|address      |string     |null: false                    |
|building     |string     |null: true                     |
|phone_number |integer    |null: false                    |
|user         |references |null: false, foreign_key: true |
|item         |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

