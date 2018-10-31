
Comment.all.destroy_all
Like.all.destroy_all
PrivateMessage.all.destroy_all
Tag.all.destroy_all
Gossip.all.destroy_all
User.all.destroy_all
City.all.destroy_all

10.times do |c|
  City.create(name:Faker::Nation.capital_city, postal_code:rand(1000..9000))
end

10.times do |n|
   User.create(first_name:Faker::FunnyName.name, last_name: Faker::FunnyName.name, description: Faker::StarWars.quote, email: Faker::Internet.email, age: rand(18..65), city_id:rand(City.first.id..City.last.id))
end

20.times do |g|
  Gossip.create(content:Faker::StarWars.quote, date:Faker::Date.backward(100), user_id:rand(User.first.id..User.last.id), anonymous_gossiper: Faker::FunnyName.name)
end

10.times do |t|
  Tag.create(title:Faker::Color.color_name)
end

20.times do |index|
  Gossip.find(Gossip.first.id + index).tags << Tag.find(rand(Tag.first.id..Tag.last.id))
end

20.times do |m|
  PrivateMessage.create(content: Faker::StarWars.quote, date: Faker::Date.backward(100), sender_id:rand(User.first.id..User.last.id))
end

20.times do |t|
  PrivateMessage.find(PrivateMessage.first.id + t).recipients << User.find(rand(User.first.id..User.last.id))
  PrivateMessage.find(PrivateMessage.first.id + t).recipients << User.find(rand(User.first.id..User.last.id))
  PrivateMessage.find(PrivateMessage.first.id + t).recipients << User.find(rand(User.first.id..User.last.id))
  PrivateMessage.find(PrivateMessage.first.id + t).recipients << User.find(rand(User.first.id..User.last.id))
end

40.times do |c|
  Comment.create(content: Faker::StarWars.quote, user_id: rand(User.first.id..User.last.id), gossip_id: rand(Gossip.first.id..Gossip.last.id), anonymous_commentor: Faker::FunnyName.name)
end

15.times do |l|
  Like.create(user_id: rand(User.first.id..User.last.id), content_id: rand(Gossip.first.id..Gossip.last.id), content_type: "Gossip")
  Like.create(user_id: rand(User.first.id..User.last.id), content_id: rand(Comment.first.id..Comment.last.id), content_type: "Comment")
end
