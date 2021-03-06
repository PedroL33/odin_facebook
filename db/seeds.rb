# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do 
    first_name = Faker::Name.unique.male_first_name
    last_name = Faker::Name.unique.last_name
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    gender = "male"
    email = Faker::Internet.unique.safe_email(name: first_name)
    password = Faker::Internet.password(min_length: 6)
    password_confirmation = password
    User.create(first_name: first_name, last_name: last_name, birthday: birthday, gender: gender, email: email, password: password) 
end

100.times do 
    first_name = Faker::Name.unique.female_first_name
    last_name = Faker::Name.unique.last_name
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    gender = "female"
    email = Faker::Internet.unique.safe_email(name: first_name)
    password = Faker::Internet.password(min_length: 6)
    password_confirmation = password
    User.create(first_name: first_name, last_name: last_name, birthday: birthday, gender: gender, email: email, password: password) 
end

# posts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

#friendships
users = User.all
user  = users.first
friends = users[2..20]
friends.each do |friend|
  user.to_requests.create!(from_user: friend, status: "accepted")
end

