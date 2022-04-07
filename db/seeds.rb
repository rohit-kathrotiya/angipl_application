user_1 = User.create(email: "user_1@test.com", password: "123456", password_confirmation: "123456")
user_2 = User.create(email: "user_2@test.com", password: "123456", password_confirmation: "123456")

language_1 = Language.create(name: "English")
language_2 = Language.create(name: "German")
language_3 = Language.create(name: "Gujarati")
language_4 = Language.create(name: "Hindi")

2.times do
    Word.create(content: Faker::Lorem.word, language: language_1, user: user_1)
    Word.create(content: Faker::Lorem.word, language: language_2, user: user_1)
    Word.create(content: Faker::Lorem.word, language: language_3, user: user_1)
    Word.create(content: Faker::Lorem.word, language: language_4, user: user_1)
end
2.times do
    Word.create(content: Faker::Lorem.word, language: language_1, user: user_2)
    Word.create(content: Faker::Lorem.word, language: language_2, user: user_2)
    Word.create(content: Faker::Lorem.word, language: language_3, user: user_2)
    Word.create(content: Faker::Lorem.word, language: language_4, user: user_2)
end