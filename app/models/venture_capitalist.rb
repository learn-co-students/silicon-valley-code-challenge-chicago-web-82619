class VentureCapitalist
  @@all = []
  attr_reader :name, :total_worth

  def initialize(name, worth)
    @name = name
    @total_worth = worth
    @@all << self
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map {|round| round.startup}.uniq
  end

  def biggest_investment
    funding_rounds.reduce() {|memo, round| round.investment > memo.investment ? round : memo}
  end

  def invested(domain)
    funding_rounds.select {|round| round.startup.domain == domain}.map {|round| round.investment}.sum
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select {|capitalist| capitalist.total_worth >= 1000000000}
  end
end
