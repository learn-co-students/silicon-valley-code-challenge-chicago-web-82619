require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

airbnb = Startup.new("Airbnb", "kyle", "asdgfsgfas")
root = Startup.new("Root", "kyle", "the")
lemonade = Startup.new("Lemonade", "becky", "domain")

bill = VentureCapitalist.new("bill", 1234567890)
steve = VentureCapitalist.new("steve", 2345678901)
me = VentureCapitalist.new("me", 100000)

round1 = FundingRound.new("aplha", 100.0, airbnb, bill)
round2 = FundingRound.new("beta", 200.0, root, steve)
round3 = FundingRound.new("test", -30.0, lemonade, me)
round4 = FundingRound.new("t", 50.0, airbnb, steve)
round5 = FundingRound.new("plant", 1.0, airbnb, me)
round6 = FundingRound.new("good", 1000.0, airbnb, steve)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line