module CurrencyExchangeRates
  require 'json'

  def self.get_rates_by_date(source_config)
    JSON.parse(read_exchange_source(source_config))
  end

  private
  def self.read_exchange_source(source_config)
    open(source_config[:file]).read
  end

end
