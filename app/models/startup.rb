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

    def self.all 
        @@all
    end

    def domain=(domain)
        @domain = domain
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder)
        all.find { |startup| startup.founder == founder }
    end

    def self.domains
        all.map { |startup| startup.domain }
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(type, investment, self, venture_capitalist)
    end

    def num_funding_rounds
        FundingRound.all.select { |round| round.startup == self }.count
    end

    def total_funds
        investments = FundingRound.all.select { |round| round.startup.name == self.name }
        total = investments.map { |round| round.investment }
        total.select { |element| element.class == Float }.reduce(:+)
    end

    def investors
        investor = FundingRound.all.select { |round| round.startup.name == self.name }
        investor.map { |round| round.venture_capitalist }
    end

    def big_investor
        big_bois = self.investors
        other_big_bois = VentureCapitalist.tres_commas_club
        big_bois & other_big_bois
    end
end
