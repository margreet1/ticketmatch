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
  puts "match created"
end
puts "all done"
