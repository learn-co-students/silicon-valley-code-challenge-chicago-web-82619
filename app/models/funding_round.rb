class FundingRound
  @@all = []
  attr_reader :startup, :venture_capitalist, :type, :investment

  def initialize(startup, vc, type, amount)
    @startup = startup
    @venture_capitalist = vc
    @type = type
    @investment = amount
    @@all << self
  end

  def self.all
    @@all
  end
end
