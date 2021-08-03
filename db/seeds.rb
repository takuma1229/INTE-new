# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  # TODO: admin属性を追加する
  # admin:     true,
  activated: true,
  activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
   email: email,
   password:              password,
   password_confirmation: password,
   activated: true,
   activated_at: Time.zone.now,
   mother_tongue: "Japanese",
   japanese_level: "Capable of advanced conversation",
   english_level: "Beginner",
   gender: "I don't want to tell",
   region: "Asia",
   purpose: "Want to talk with Foreingers",
   self_introduction: "Hi! This is Demo user of INTE. If there is any problem abount this app, feel free to contact inteofficial@gmail.com .",
   skype: "https://www.youtube.com/user/SeikinTV",
   discord: "https://twitter.com/dejiko_15th")
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }