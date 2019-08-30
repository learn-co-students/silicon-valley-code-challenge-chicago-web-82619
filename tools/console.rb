require_relative '../config/environment.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Silicon","GJ","Tech")
s2 = Startup.new("Silicon","GJ","Tech")
s3 = Startup.new("Silicon","GJ","Tech")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line