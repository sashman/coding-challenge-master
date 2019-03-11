module RatesSource
  require 'json'

  def self.from(source_config)
    JSON.parse(read_exchange_source(source_config))
  end

  def self.read_exchange_source(source_config)
    open(source_config[:file]).read
  end
end
