#before seeding run rails db drop,create, migrate

require 'unirest'

response = Unirest.get "https://api-football-v1.p.mashape.com/fixtures/league/2",
  headers:{
    "X-Mashape-Key" => ENV["MATCH_API"],
    "Accept" => "application/json"
  }

Match.destroy_all
puts "creating matches"
response.body['api']['fixtures'].each do |fixture|
  Match.create!(
    home_team: fixture.second["homeTeam"],
    away_team: fixture.second["awayTeam"],
    date: fixture.second["event_date"]
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

Seat.destroy_all
puts "creating seasts"
10.times do
  Seat.create!(
    number: Faker::Number.hexadecimal(3),
    description: ["Great seat", "Fantastic view", "View the game from a distance", "Boxes, free snacks included", "Loudest crowd in England", "Great atmosphere"].sample,
    user_id: [user1, user2].sample
  )
end
puts "seats made"

seat1 = Seat.first.id
seat2 = Seat.second.id
seat3 = Seat.third.id
seat4 = Seat.last.id

puts "making tickets"

MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match1)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match1)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match1)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match1)

MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match2)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match2)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match2)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match2)

MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat1, match_id: match3)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat2, match_id: match3)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat3, match_id: match3)
MatchTicket.create!(price: Faker::Commerce.price, seat_id: seat4, match_id: match3)

puts "tickets made"

sold1 = MatchTicket.first.id
sold2 = MatchTicket.second.id
sold3 = MatchTicket.last.id

puts "making bookings"

Booking.create(user_id: user3, match_ticket_id: sold1)
Booking.create(user_id: user3, match_ticket_id: sold2)
Booking.create(user_id: user3, match_ticket_id: sold3)

puts "bookings made "




