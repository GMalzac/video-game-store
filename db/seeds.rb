require 'faker'

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 123456,
    password_confirmation: 123456,
    username: Faker::Name.name,
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    phone_number: rand(999999..9999999),
    address: "138 kinsland road",
    description: Faker::HowIMetYourMother.quote,
    )
  user.save!
end

20.times do
  item = Item.new(
  user_id: 1 + rand(5),
  title: Faker::App.name,
  description: Faker::HowIMetYourMother.catch_phrase,
  price: 1 + rand(50),
  console: ["Playstation 4", "Xbox One", "Nintendo Switch", "Playstation 3", "Xbox 360", "Nintendo 3DS", "PC", "PS Vita"].sample,
  category: ["Game", "Console", "Peripheral"].sample
    )
  item.save!
end
