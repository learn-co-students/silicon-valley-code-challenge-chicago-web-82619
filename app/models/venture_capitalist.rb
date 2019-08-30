class VentureCapitalist
    attr_reader :name, :total_worth
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
        all.select{|vc| vc.total_worth > 1000000000}
    end
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    def funding_rounds
        FundingRound.all.select{|obj| obj.venture_capitalist == self}
    end
    def portfolio
        funding_rounds.map{|obj| obj.startup.name}.uniq
    end
    def biggest_investment
        arr = funding_rounds.map{|obj| obj.investment}
        arr.max
    end
    def invested(domain)
        arr = funding_rounds.select{|obj| obj.startup.domain == domain}
        sum = arr.select{|obj| obj.investment}
        sum
    end
end
