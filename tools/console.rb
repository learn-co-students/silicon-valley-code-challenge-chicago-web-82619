require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

airbnb = Startup.new("airbnb", "kyle", "dfirst")
root = Startup.new("Root", "kyle", "dsecond")
lemonade = Startup.new("Lemonade", "becky", "dthird")

bill = VentureCapitalist.new("Bill", 2000000000)
steve = VentureCapitalist.new("Steve", 3000000000)
me = VentureCapitalist.new("Laura", 100000)

round1 = FundingRound.new("alpha", 100.0, airbnb, bill)
round2 = FundingRound.new("beta", 200.0, root, steve)
round3 = FundingRound.new("launch", 150.0, airbnb, steve)
round4 = FundingRound.new("DLC", 300.0, airbnb, steve)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line