require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
fb = Startup.new('Facebook', 'Zuckerberg', 'social media')
apple = Startup.new('Apple', 'Jobs', 'computers')
gates = VentureCapitalist.new('Gates', 100000000000)
bezos = VentureCapitalist.new('Bezos', 70000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
