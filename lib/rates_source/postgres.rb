class Postgres
  require 'pg'

  def initialize(source_config)
    @conn = PG.connect(source_config)
  end

  def rate_on_date(currency, date)
    1
  end

  def date?(date)
    true
  end

  def rate_on_date?(currency, date)
    true
  end

end
