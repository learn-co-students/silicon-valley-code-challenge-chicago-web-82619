class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []
    def initialize(startup, venture_capitalist, type, investment)
        (investment > 0) ? @investment = investment.to_f : @investment = 0.to_f
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @@all << self
    end
    def self.all
        @@all
    end
    
end
