# These are just suggested definitions to get you started.  Please feel
# free to make any changes at all as you see fit.

# http://test-unit.github.io/
require 'test/unit'
require 'currency_exchange'
require 'date'

class CurrencyExchangeTest < Test::Unit::TestCase
  def setup; end

  def test_non_base_currency_exchange_is_correct
    correct_rate = 1.2870493690602498
    assert_equal correct_rate,
                 CurrencyExchange.rate(Date.new(2018, 11, 22), 'GBP', 'USD')
  end

  def test_base_currency_exchange_is_correct
    correct_rate = 0.007763975155279502
    assert_equal correct_rate,
                 CurrencyExchange.rate(Date.new(2018, 11, 22), 'JPY', 'EUR')
  end

  def test_from_base_currency_exchange_is_correct
    correct_rate = 128.8
    assert_equal correct_rate,
                 CurrencyExchange.rate(Date.new(2018, 11, 22), 'EUR', 'JPY')
  end

  def test_fallback_data_source
    correct_rate = 1.12
    assert_equal correct_rate,
                 CurrencyExchange.rate(Date.new(2019, 3, 12), 'EUR', 'USD')
  end

  def test_missing_date_throws_exception
    assert_raise ArgumentError do
      CurrencyExchange.rate(Date.new(1018, 1, 2), 'JPY', 'EUR')
    end
  end

  def test_missing_from_rate_throws_exception
    assert_raise ArgumentError do
      CurrencyExchange.rate(Date.new(2018, 11, 22), 'LOL', 'EUR')
    end
  end

  def test_missing_to_rate_throws_exception
    assert_raise ArgumentError do
      CurrencyExchange.rate(Date.new(2018, 11, 22), 'JPY', 'LOL')
    end
  end
end
