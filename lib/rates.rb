class Rates

  def initialize(base_currency, daily_rates)
    @base_currency = base_currency
    @daily_rates = daily_rates
  end

  def date?(date)
    string_date = date.strftime('%F')
    @daily_rates.date?(string_date)
  end

  def rate_on_date?(currency, date)
    return true if currency == @base_currency

    string_date = date.strftime('%F')
    date?(date) && @daily_rates.rate_on_date?(currency, string_date)
  end

  def rate_on_date(currency, date)
    return 1 if currency == @base_currency

    string_date = date.strftime('%F')
    @daily_rates.rate_on_date(currency, string_date)
  end

end
