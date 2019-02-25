module CurrencyExchange
  require 'rates'
  require 'validation'

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    base_currency = 'EUR'
    rates_by_date = Rates.get_rates_by_date(file: 'data/eurofxref-hist-90d.json')
    string_date = date.strftime('%F')

    Validation.validate_date(string_date, rates_by_date)
    date_rates = rates_by_date[string_date]

    Validation.validate_currency(from_currency, base_currency, date_rates)
    Validation.validate_currency(to_currency, base_currency, date_rates)

    from_rate = get_rate(from_currency, base_currency, date_rates)
    to_rate = get_rate(to_currency, base_currency, date_rates)

    calculate(from_rate, to_rate)
  end

  def self.get_rate(currency, base_currency, rates)
    return 1 if currency == base_currency

    rates[currency]
  end

  def self.calculate(from_rate, to_rate)
    to_rate.to_f / from_rate.to_f
  end
end
