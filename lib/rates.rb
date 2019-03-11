class Rates

  def initialize(base_currency, daily_rates)
    @base_currency = base_currency
    @daily_rates = daily_rates
  end

  def date?(date)
    string_date = date.strftime('%F')
    @daily_rates.key?(string_date)
  end

  def rate_on_date?(currency, date)
    return true if currency == @base_currency

    string_date = date.strftime('%F')
    date?(date) && @daily_rates[string_date].key?(currency)
  end

  def rate_on_date(currency, date)
    return 1 if currency == @base_currency

    string_date = date.strftime('%F')
    @daily_rates[string_date][currency]
  end

end
