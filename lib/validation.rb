module Validation
  def self.date_present?(rates, date)
    unless rates.date?(date)
      raise ArgumentError, "Requested date (#{date}) not available"
    end
  end

  def self.rate_present?(rates, currency, date)
    unless rates.rate_on_date?(currency, date)
      raise ArgumentError, "Requested currency (#{currency}) on date (#{date}) not available"
    end
  end

end
