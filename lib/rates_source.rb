module RatesSource
  require 'rates_source/json_file'
  require 'rates_source/postgres'

  SOURCE_MAP = {
    json_file: JsonFile,
    postgres: Postgres
  }.freeze

  def self.from(type, source_config)
    return JsonFile.new(source_config) unless SOURCE_MAP.key?(type)

    SOURCE_MAP[type].new(source_config)
  end
end
