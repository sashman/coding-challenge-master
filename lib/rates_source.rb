module RatesSource
  require 'rates_source/json_file'

  def self.from(source_config)
    JsonFile.new(source_config)
  end

end
