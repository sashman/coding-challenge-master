class Postgres
  require 'pg'

  def initialize(source_config)
    @rate_query = 'SELECT rate FROM exchange_rates WHERE currency = $1 AND date = $2'
    @date_query = 'SELECT rate FROM exchange_rates WHERE date = $1'

    @conn = PG.connect(source_config)
  end

  def rate_on_date(currency, date)
    result = @conn.exec_params(@rate_query, [currency, date])

    result[0]['rate']
  end

  def date?(date)
    result = @conn.exec_params(@date_query, [date])
    !result.num_tuples.zero?
  end

  def rate_on_date?(currency, date)
    result = @conn.exec_params(@rate_query, [currency, date])
    !result.num_tuples.zero?
  end
end
