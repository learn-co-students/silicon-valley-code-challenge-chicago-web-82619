class VentureCapitalist

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
        @@all.select {|venture_capitalist| venture_capitalist.worth >= 1000000000}
    end

    def tres_commas_club?
        if @worth >= 1000000000
            self
        else
            nil
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|funding_rounds| funding_rounds.startup}.uniq
    end

    def biggest_investment
        all_investments = funding_rounds.map {|funding_rounds| funding_rounds.investment}
        max_investment = all_investments.sort[-1]
        funding_rounds.find {|funding_rounds| funding_rounds.investment == max_investment}
    end

    def invested(domain)
        within_domain = funding_rounds.select {|funding_rounds| funding_rounds.domain == domain}
        investments = within_domain.map {|funding_round| funding_round.investment}
        amount_invested = investments.reduce(:+)
        if amount_invested == nil
            0
        else
            amount_invested
        end
    end

end
