class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select { |investor| investor.total_worth > 1000000000 }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(type, investment, startup, self)
    end

    def funding_rounds
        FundingRound.all.select { |round| round.venture_capitalist == self }
    end

    def portfolio
        startups = FundingRound.all.select { |round| round.venture_capitalist.name == self.name }
        startups.map { |round| round.startup }.uniq
    end

    def biggest_investment
        funding = self.funding_rounds
        highest_investment = 0
        funding.select { |round| 
            if round.investment > highest_investment
                highest_investment = round.investment
            end
        }
        highest_investment
    end

    def invested(domain)
        total = 0.0
        invested = FundingRound.all.select { |round| round.venture_capitalist.name == self.name }
        domains = invested.select { |round| 
            if round.startup.domain == domain
                total += round.investment.to_f
            end
        }
        total
    end

end