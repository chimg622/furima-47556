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
|first_name_kana    |string |null: false                |
|birth_year         |string |null: false                |
|birth_month        |string |null: false                |
|birth_day          |string |null: false                |

### Association
has_many :items
has_many :purchases


## itemsテーブル
|Colum              |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|name               |string     |null: false                    |
|info               |text       |null: false                    |
|price              |integer    |null: false                    |
|category           |string     |null: false                    |
|status             |string     |null: false                    |
|delivery_fee       |string     |null: false                    |
|prefecture         |string     |null: false                    |
|delivery_scheduled |string     |null: false                    |
|user               |references |null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## purchasesテーブル
|Colum        |Type       |Options                        |
|-------------|-----------|-------------------------------|
|user         |references |null: false, foreign_key: true |
|item         |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル
|Colum        |Type       |Options                        |
|-------------|-----------|-------------------------------|
|post_number  |string     |null: false                    |
|city         |string     |null: false                    |
|address      |string     |null: false                    |
|building     |string     |null: true                     |
|phone_number |string     |null: false                    |
|purchase     |references |null: false, foreign_key: true |

### Association
belongs_to :purchase