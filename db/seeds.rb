#before seeding run rails db drop,create, migrate

require 'unirest'

response = Unirest.get "https://api-football-v1.p.mashape.com/fixtures/league/2",
  headers:{
    "X-Mashape-Key" => ENV["MATCH_API"],
    "Accept" => "application/json"
  }

stadiums = {
  "Manchester United" => "https://cdn.pixabay.com/photo/2017/01/06/22/48/old-trafford-1959155_960_720.jpg",
  "Chelsea" => "https://cdn.pixabay.com/photo/2015/04/06/11/55/stadium-709181__340.jpg",
  "Liverpool" => "https://cdn.pixabay.com/photo/2015/07/19/20/04/anfield-851936_960_720.jpg",
  "Arsenal" => "https://cdn.pixabay.com/photo/2016/08/11/05/29/arsenal-1584845_960_720.jpg",
  "Manchester City" => "https://cdn.pixabay.com/photo/2017/09/18/11/18/manchester-city-2761407_960_720.jpg",
  "Tottenham" => "https://cdn.pixabay.com/photo/2017/08/30/23/42/football-2698974_960_720.jpg",
  "Everton" => "https://cdn.pixabay.com/photo/2018/07/28/20/44/football-3568903__340.jpg",
  "Leicester" => "https://cdn.pixabay.com/photo/2018/07/27/19/25/football-3566688_960_720.jpg",
  "West Ham" => "https://cdn.pixabay.com/photo/2018/07/27/19/27/football-3566695_960_720.jpg",
  "Newcastle" => "https://cdn.pixabay.com/photo/2018/07/27/19/26/football-3566693_960_720.jpg",
  "Crystal Palace" => "https://cdn.pixabay.com/photo/2018/06/12/20/17/football-3471402_960_720.jpg",
  "Southampton" => "https://cdn.pixabay.com/photo/2018/07/28/20/44/football-3568907_960_720.jpg",
  "Fulham" => "https://cdn.pixabay.com/photo/2017/04/16/19/22/football-2235603__340.jpg",
  "Wolverhampton" => "https://cdn.pixabay.com/photo/2018/07/28/20/45/football-3568910__340.jpg",
  "Burnley" => "https://cdn.pixabay.com/photo/2018/07/28/20/44/football-3568904_960_720.jpg",
  "Bournemouth" => "https://cdn.pixabay.com/photo/2014/10/14/20/24/the-ball-488709_960_720.jpg",
  "Watford" => "https://cdn.pixabay.com/photo/2014/10/14/20/24/the-ball-488709_960_720.jpg",
  "Cardiff" => "https://cdn.pixabay.com/photo/2014/10/14/20/24/the-ball-488709_960_720.jpg",
  "Huddersfield" => "https://cdn.pixabay.com/photo/2014/10/14/20/24/the-ball-488709_960_720.jpg",
  "Brighton" => "https://cdn.pixabay.com/photo/2014/10/14/20/24/the-ball-488709_960_720.jpg",
}

Match.destroy_all
puts "creating matches"
response.body['api']['fixtures'].each do |fixture|
  Match.create!(
    home_team: fixture.second["homeTeam"],
    away_team: fixture.second["awayTeam"],
    date: fixture.second["event_date"],
    photo: stadiums[fixture.second["homeTeam"]]
  )
end
puts "matches created"

match1 = Match.find(21).id
match2 = Match.find(22).id
match3 = Match.find(23).id

User.destroy_all
4.times do
User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "openplease"
  )
end

user1 = User.first.id
user2 = User.second.id
user3 = User.last.id

 teams = ["Manchester United",
 "Newcastle",
 "Bournemouth",
 "Fulham",
 "Huddersfield",
 "Watford",
 "Wolverhampton",
 "Liverpool",
 "Southampton",
 "Arsenal",
 "Cardiff",
 "West Ham",
 "Tottenham",
 "Leicester",
 "Everton",
 "Chelsea",
 "Burnley",
 "Manchester City",
 "Brighton",
 "Crystal Palace"]

Seat.destroy_all
puts "creating seasts"
100.times do
  Seat.create!(
    number: Faker::Number.hexadecimal(3),
    description: ["Great seat", "Fantastic view", "View the game from a distance", "Boxes, free snacks included", "Loudest crowd in England", "Great atmosphere"].sample,
    user_id: [user1, user2].sample,
    team: teams.sample
  )
end
puts "seats made"

seat1 = Seat.first.id
seat2 = Seat.second.id
seat3 = Seat.third.id
seat4 = Seat.last.id

puts "making booking"

Booking.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match1, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match1, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match1, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match1, user_id: user3)

Booking.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match2, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match2, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match2, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match2, user_id: user3)

Booking.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match3, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match3, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match3, user_id: user3)
Booking.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match3, user_id: user3)

puts "bookings made"







