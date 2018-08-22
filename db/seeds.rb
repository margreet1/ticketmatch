#before seeding run rails db drop,create, migrate

require 'unirest'

response = Unirest.get "https://api-football-v1.p.mashape.com/fixtures/league/2",
  headers:{
    "X-Mashape-Key" => ENV["MATCH_API"],
    "Accept" => "application/json"
  }

stadiums = {
  "Manchester United" => "manchester_united.jpg",
  "Chelsea" => "chelsea.jpg",
  "Liverpool" => "liverpool.jpg",
  "Arsenal" => "arsenal.jpg",
  "Manchester City" => "manchester_city.jpg",
  "Tottenham" => "tottenham.jpg",
  "Everton" => "everton.jpg",
  "Leicester" => "leicester.jpg",
  "West Ham" => "west_ham.jpg",
  "Newcastle" => "newcastle.jpg",
  "Crystal Palace" => "crystal_palace.jpg",
  "Southampton" => "southampton.jpg",
  "Fulham" => "fulham.jpg",
  "Wolverhampton" => "wolverhampton.jpg",
  "Burnley" => "burnley.jpg",
  "Bournemouth" => "bournemouth.jpg",
  "Watford" => "watford.jpg",
  "Cardiff" => "cardiff.jpg",
  "Huddersfield" => "huddersfield.jpg",
  "Brighton" => "brighton.jpg",
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
puts "creating seats"
100.times do
  Seat.create!(
    number: Faker::Number.hexadecimal(3),
    description: ["Great seat", "Fantastic view", "View the game from a distance", "Boxes, free snacks included", "Loudest crowd in England", "Great atmosphere"].sample,
    user_id: [user1, user2].sample,
    team: teams.sample,
    # price: Faker::Commerce.price
    price: [40, 50, 60, 70, 80, 90, 100, 120, 150].sample
  )
end
puts "seats made"

seat1 = Seat.first.id
seat2 = Seat.second.id
seat3 = Seat.third.id
seat4 = Seat.last.id

puts "making booking"

Booking.create!(seat_id: seat1, match_id: match1, user_id: user3)
Booking.create!(seat_id: seat2, match_id: match1, user_id: user3)
Booking.create!(seat_id: seat3, match_id: match1, user_id: user3)
Booking.create!(seat_id: seat4, match_id: match1, user_id: user3)

Booking.create!(seat_id: seat1, match_id: match2, user_id: user3)
Booking.create!(seat_id: seat2, match_id: match2, user_id: user3)
Booking.create!(seat_id: seat3, match_id: match2, user_id: user3)
Booking.create!(seat_id: seat4, match_id: match2, user_id: user3)

Booking.create!(seat_id: seat1, match_id: match3, user_id: user3)
Booking.create!(seat_id: seat2, match_id: match3, user_id: user3)
Booking.create!(seat_id: seat3, match_id: match3, user_id: user3)
Booking.create!(seat_id: seat4, match_id: match3, user_id: user3)

puts "bookings made"







