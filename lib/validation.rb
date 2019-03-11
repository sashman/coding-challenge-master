module Validation
  def self.validate_date(string_date, exchange_rates)
    unless exchange_rates.key?(string_date)
      raise ArgumentError, "Requested date (#{string_date}) not available"
    end
  end

  def self.validate_currency(currency, base_currency, exchange_rates)
    unless exchange_rates.key?(currency) || (currency == base_currency)
      raise ArgumentError, "Requested currency (#{currency}) not available"
    end
  end

  def self.date_present?(rates, date)
    unless rates.date?(date)
      raise ArgumentError, "Requested date (#{date}) not available"
    end
  end

end
