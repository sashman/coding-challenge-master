class RatesSource
  require 'json'

  def initialize(source_config)
    @data = JSON.parse(read_exchange_source(source_config))
  end

  def rate_on_date(currency, date)
    @data[date][currency]
  end

  def date?(date)
    @data.key?(date)
  end

  def rate_on_date?(currency, date)
    @data.key?(date) && @data[date].key?(currency)
  end

  private

  def read_exchange_source(source_config)
    open(source_config[:file]).read
  end
end
