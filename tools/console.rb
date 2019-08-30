require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("Startup1", "Founder1","Domain1")
startup2 = Startup.new("Startup2", "Founder2","Domain2")
startup3 = Startup.new("Startup3", "Founder3","Domain3")
vc1 = VentureCapitalist.new("Vc1", 200000000000000)
vc2 = VentureCapitalist.new("Vc2", 100000)
vc3 = VentureCapitalist.new("Vc1", 98000000000000000)
fr1 = FundingRound.new(startup1, vc1, "Type1", 90.45)
fr2 = FundingRound.new(startup2, vc2, "Type2", -400)
fr3 = FundingRound.new(startup3, vc3, "Type3", 90000)
fr4 = FundingRound.new(startup2, vc1, "Type1", 60000)
fr5 = FundingRound.new(startup3, vc1, "Type1", 9999999999)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line