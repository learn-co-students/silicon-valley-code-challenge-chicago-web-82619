class VentureCapitalist

    attr_accessor :worth, :startup, :type, :investment
    attr_reader :name, :domain

    @@all = []

    def initialize(name, worth)
        @name = name
        @worth = worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select {|investors| investors.worth > 1000000000}
    end


    def offer_contract(startup, type, investment)
        FundingRound.new(type, investment, startup, self)
        # given a startup object, type of investment (as a string), and the amount invested (as a float), 
        # creates a new funding round and associates it with that startup and venture capitalist.
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
        # VentureCapitalist#funding_rounds
        # returns an array of all funding rounds for that venture capitalist
    end

    def portfolio
        port = FundingRound.all.select {|round| round.venture_capitalist.name == name}
        port.map {|round| round.startup}.uniq
        # Returns a unique list of all startups this venture capitalist has funded
        #for this method and similar one's in the startup class, if you want JUST the name, add .name
        #so line 37 would have round.startup.name to return ["Root", "airbnb"] vs all associated information
    end

    def biggest_investment
        big_money = funding_rounds.map {|round| round.investment}
        bigger_money = big_money.sort[-1]
        funding_rounds.find {|round| round.investment == bigger_money}
        # returns the largest funding round given by this venture capitalist
        #calls the method that returns an array of all funding rounds for an investor, pulls out the investment values
        #sorts the values and pulls out the last value of the array
        #finds the value within the original funding_rounds array that matches that array[-1] value
    end

    def invested(domain)
        d_value = funding_rounds.select {|round| round.startup.domain == domain}
        d_value.map {|value| value.investment}.sum

        # s_name = value_domain.map {|domain| domain.name}
        # s_name.select.reduce { |invest| invest.investment}

        # funding_rounds.select {|round| round.startup.domain == domain}.map {|round| round.investment}.sum

        #iterate over startup to get name that matches domain
        #iterate over fundingrounds to get investment amount matching name

        # given a domain string, returns the total amount invested in that domain
    end
end
