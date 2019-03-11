module CurrencyExchange
  require 'rates_source'
  require 'validation'
  require 'rates'

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    base_currency = 'EUR'
    rates_by_date = RatesSource.get_rates_by_date(file: 'data/eurofxref-hist-90d.json')
    string_date = date.strftime('%F')

    rates = Rates.new('EUR', rates_by_date)

    Validation.date_present?(rates, date)
    date_rates = rates_by_date[string_date]

    Validation.validate_currency(from_currency, base_currency, date_rates)
    Validation.validate_currency(to_currency, base_currency, date_rates)

    from_rate = rates.rate_on_date(from_currency, date)
    to_rate = rates.rate_on_date(to_currency, date)

    calculate(from_rate, to_rate)
  end

  def self.calculate(from_rate, to_rate)
    to_rate.to_f / from_rate.to_f
  end
end
