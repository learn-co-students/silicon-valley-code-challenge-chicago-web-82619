class Startup
  @@all = []
  attr_reader :name, :founder, :domain

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @name = name
    @domain = domain
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  # helper
  def funding_rounds
    FundingRound.all.select {|round| round.startup == self}
  end
  
  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    funding_rounds.map {|round| round.investment}.sum
  end

  def investors
    funding_rounds.map {|round| round.venture_capitalist}.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.find {|startup| startup.founder == founder}
  end

  def self.domains
    all.map {|startup| startup.domain}.uniq
  end

end
