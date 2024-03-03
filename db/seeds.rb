# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#親のレコードを作成
hokkaido, tohoku, kanto, chubu, kinki, chugoku, shikoku, kyushu  = Region.create(
    [
        { name: '北海道地方' },
        { name: '東北地方' },
        { name: '関東地方' },
        { name: '中部地方' },
        { name: '近畿地方' },
        { name: '中国地方' },
        { name: '四国地方' },
        { name: '九州地方' }
    ]
)

#子のレコードを作成
['北海道'].each do |name|
    hokkaido.children.create(name: name)
end

['青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県'].each do |name|
    tohoku.children.create(name: name)
end

['東京都', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '神奈川県'].each do |name|
    kanto.children.create(name: name)
end

['新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県'].each do |name|
    chubu.children.create(name: name)
end

['京都府', '大阪府', '三重県', '滋賀県', '兵庫県', '奈良県', '和歌山県'].each do |name|
    kinki.children.create(name: name)
end

['鳥取県', '島根県', '岡山県', '広島県', '山口県'].each do |name|
    chugoku.children.create(name: name)
end

['徳島県', '香川県', '愛媛県', '高知県'].each do |name|
    shikoku.children.create(name: name)
end

['福岡県', '佐賀県', '長崎県', '大分県', '熊本県', '宮崎県', '鹿児島県', '沖縄県'].each do |name|
    kyushu.children.create(name: name)
end