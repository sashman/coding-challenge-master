module CurrencyExchange
  require 'rates_source'
  require 'validation'
  require 'rates'

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    rates_by_date = RatesSource.new(file: 'data/eurofxref-hist-90d.json')
    rates = Rates.new('EUR', rates_by_date)

    Validation.date_present?(rates, date)
    Validation.rate_present?(rates, from_currency, date)
    Validation.rate_present?(rates, to_currency, date)

    from_rate = rates.rate_on_date(from_currency, date)
    to_rate = rates.rate_on_date(to_currency, date)

    calculate(from_rate, to_rate)
  end

  def self.calculate(from_rate, to_rate)
    to_rate.to_f / from_rate.to_f
  end
end
