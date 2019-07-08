after 'development:users' do
  attributes = [
    {
      title: "池袋ロサ毎週水曜日開催！初心者大歓迎です！",
      body: Faker::Lorem.paragraphs((1..10).to_a.sample).join("\n"),
      prefecture_ids: [[13, 4], [12]].sample,
      user_id: User.pluck(:id).sample
    },
    {
      title: "イギリスで大人気のスヌーカーをしてみませんか？",
      body: Faker::Lorem.paragraphs((1..10).to_a.sample).join("\n"),
      prefecture_ids: [[13, 4], [12]].sample,
      user_id: User.pluck(:id).sample
    },
    {
      title: "ナインボールの妙技を伝授します！",
      body: Faker::Lorem.paragraphs((1..10).to_a.sample).join("\n"),
      prefecture_ids: [[13, 4], [12]].sample,
      user_id: User.pluck(:id).sample
    },
    {
      title: "金曜の仕事終わりに、一緒にビリヤードを楽しみませんか？",
      body: Faker::Lorem.paragraphs((1..10).to_a.sample).join("\n"),
      prefecture_ids: [[13, 4], [12]].sample,
      user_id: User.pluck(:id).sample
    },
    {
      title: "エフレン・レイズの伝説のショットを再現してみませんか！？",
      body: Faker::Lorem.paragraphs((1..10).to_a.sample).join("\n"),
      prefecture_ids: [[13, 4], [12]].sample,
      user_id: User.pluck(:id).sample
    }
  ]

  500.times do
    attr = attributes.sample
    Article.create do |article|
      article.title          = attr[:title]
      article.body           = attr[:body]
      article.prefecture_ids = attr[:prefecture_ids]
      article.user_id        = attr[:user_id]
    end
  end
end
