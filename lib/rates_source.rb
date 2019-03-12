module RatesSource
  require 'rates_source/json_file'
  require 'rates_source/postgres'

  def self.from(source_config)
    # JsonFile.new(source_config)
    Postgres.new(source_config)
  end

end
