attributes = [
  {
    avatar: "head.jpg",
    name: "ヘッドさん",
    email: "headiv94@gmail.com",
    gender: :male,
    birthday: Time.zone.parse('1994-01-13'),
    activity_prefecture_ids: [[1, 13], [12]].sample,
    introduction: "頑張る！"
  },
  {
    avatar: "kenichi.jpg",
    name: "けんいち",
    email: "kenichi@gmail.com",
    gender: :male,
    birthday: Time.zone.parse('1997-12-10'),
    activity_prefecture_ids: [13]
  },
  {
    avatar: "boromari.jpg",
    name: "ぼろまり",
    email: "boroboro@gmail.com",
    gender: :female,
    birthday: Time.zone.parse('1990-03-12'),
    activity_prefecture_ids: [3],
    introduction: "youtubeにビリヤード動画あげてます！よかったら仲良くしてね！"
  },
  {
    avatar: "shibata.jpg",
    name: "しばた　みのる",
    email: "shibata@gmail.com",
    gender: :male,
    birthday: Time.zone.parse('1975-03-12'),
    activity_prefecture_ids: [[1, 13], [12]].sample
  },
  {
    avatar: "hayato.jpg",
    name: "土方隼斗",
    email: "tsuchikata@gmail.com",
    gender: :male,
    birthday: Time.zone.parse('1985-04-11'),
    activity_prefecture_ids: [13],
    introduction: "プロやってます！日本一位目指して日々練習頑張ります！"
  },
  {
    name: "ふうる",
    email: "fool@gmail.com",
    gender: :male,
    birthday: Time.zone.parse('1981-05-16'),
    activity_prefecture_ids: [1],
    introduction: "全員ぶっ倒す。俺に勝てるハスラーがいるのか？"
  }
]

attributes.each do |attr|
  User.find_or_create_by(email: attr[:email]) do |user|
    File.open("#{Rails.root}/app/assets/images/samples/users/#{attr[:avatar]}") { |sample_image| user.avatar = sample_image } if attr[:avatar].present?

    user.name                    = attr[:name]
    user.email                   = attr[:email]
    user.gender                  = attr[:gender]
    user.birthday                = attr[:birthday]
    user.activity_prefecture_ids = attr[:activity_prefecture_ids]
    user.introduction            = attr[:introduction]
    user.password                = "password"
    user.password_confirmation   = "password"
  end
end
