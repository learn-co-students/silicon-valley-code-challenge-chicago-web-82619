class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    @@domains = []

    def initialze(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain
    end

    def pivot(domain, name)
        @name = new_name
        @domain = new_domain
    end

    def self.all
        @@all
    end

    def find_by_founder(name)
        @@all.find {|startup| startup.name == name}
    end

    def self.domains
        @@domains.uniq
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        total_funds = funding_rounds.map {|funding_rounds| funding_rounds.investment}
        total_funds.reduce(:+)
    end

    def investors
        funding_rounds.map {|funding_rounds| funding_rounds.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|investors| investors.tres_commas_club?}
    end

end
