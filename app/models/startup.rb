class Startup

    attr_reader :founder, :domain
    attr_accessor :name, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain    
        @@all << self 
    end

    def domain=(domain)
        @domain = domain
    end

    def pivot(name, domain)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        all.find {|startup| startup.founder == founder}        
    end

    def self.domains
        all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(type, investment, self, venture_capitalist)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.count
        #Returns the total number of funding rounds that the startup has gotten
    end

    def total_funds
        investments = FundingRound.all.select {|round| round.startup.name == self.name}
        total_invest = investments.map { |round| round.investment}
        total_invest.select { |value| value.class == Float}.reduce(:+)
        #Returns the total sum of investments that the startup has gotten
    end

    def investors
        investor = FundingRound.all.select { |round| round.startup.name == self.name}
        investor.map { |round| round.venture_capitalist}
        #Returns a unique array of all the venture capitalists that have invested in this company
    end

    def big_investors
        big_bois = self.investors
        biggest_bois = VentureCapitalist.tres_commas_club
        big_bois & biggest_bois
        # Returns a unique array of all the venture capitalists 
        #that have invested in this company and are in the Trés Commas club
    end

end
