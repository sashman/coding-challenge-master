module CurrencyExchange

  require "currency_exchange_rates"
  require "currency_exchange_validation"

  # Return the exchange rate between from_currency and to_currency on date as a float.
  # Raises an exception if unable to calculate requested rate.
  # Raises an exception if there is no rate for the date provided.
  def self.rate(date, from_currency, to_currency)
    # TODO: calculate and return rate
    base_currency = 'EUR'
    rates_by_date =
      CurrencyExchangeRates.get_rates_by_date({file: 'data/eurofxref-hist-90d.json'})

    string_date = date.strftime("%F")

    CurrencyExchangeValidation.validate_date(string_date, rates_by_date)
    date_rates = rates_by_date[string_date]

    CurrencyExchangeValidation.validate_currency(from_currency, base_currency, date_rates)
    CurrencyExchangeValidation.validate_currency(to_currency, base_currency, date_rates)

    from_rate = get_rate(from_currency, base_currency, date_rates)
    to_rate = get_rate(to_currency, base_currency, date_rates)

    to_rate.to_f / from_rate.to_f
  end

  private
  def self.get_rate(currency, base_currency, rates)
    currency == base_currency ? 1 : rates[currency]
  end

end
