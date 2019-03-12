require 'pg'
require 'json'

conn = PG.connect(host: 'localhost',
                  dbname: 'exchange_rates',
                  user: 'postgres',
                  password: 'postgres')

data = JSON.parse(open('data/eurofxref-hist-90d.json').read)

values_to_insert = []
data.each do |date, currencies|
  currencies.each do |currency, rate|
    values_to_insert.push("('#{date}', '#{currency}', #{rate})")
  end
end

extra_value = '(\'2019-03-12\', \'USD\', \'1.12\')'
values_to_insert.push(extra_value)

conn.exec("INSERT INTO
  \"public\".\"exchange_rates\" (\"date\", \"currency\", \"rate\")
  VALUES #{values_to_insert.join(',')}")
