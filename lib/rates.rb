class Rates
  def initialize(base_currency, rate_sources)
    @base_currency = base_currency
    @rate_sources = rate_sources
  end

  def date?(date)
    string_date = date.strftime('%F')
    @rate_sources.any? { |source| source.date?(string_date) }
  end

  def rate_on_date?(currency, date)
    return true if currency == @base_currency

    string_date = date.strftime('%F')
    @rate_sources.any? do |source|
      source.date?(string_date) &&
        source.rate_on_date?(currency, string_date)
    end
  end

  def rate_on_date(currency, date)
    return 1 if currency == @base_currency

    string_date = date.strftime('%F')
    @rate_sources.find do |source|
      source.rate_on_date?(currency, date)
    end.rate_on_date(currency, string_date)
  end
end
