class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
    
    @@all = []

    def initialize(type, investment, startup, venture_capitalist)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

    def investment
        if @investment > 0
            @investment.to_f
        else
            "Negative balance"
        end
    end
 
end