class Startup
    attr_reader :name, :founder, :domain
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
    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end
    def self.find_by_founder(name)
        all.find{|startup| startup.founder == name}
    end
    def self.domains
        all.map{|startup| startup.domain}
    end
    def sing_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end
    def funding_rounds
        FundingRound.all.select{|obj| obj.startup == self}
    end
    def num_funding_rounds
        funding_rounds.count
    end
    def total_funds
        arr = funding_rounds.map{|obj| obj.investment}
        arr.sum
    end
    def big_investors
        arr = funding_rounds.map{|obj| obj.venture_capitalist}
        arr & VentureCapitalist.tres_commas_club
    end
end
