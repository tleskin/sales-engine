require_relative '../lib/sales_engine'
require_relative 'test_helper'
require './lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_exists
    assert Merchant
  end

  def sample_data
    {
      id: "1",
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def setup
    @merchant = Merchant.new(sample_data, sales_engine=nil)
  end

  def test_it_has_an_id
    assert_equal 1, @merchant.id
  end

  def test_it_has_a_name
    assert_equal "Schroeder-Jerde", @merchant.name
  end

  def test_it_has_a_created_date
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
  end

  def test_it_has_an_updated_date
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

  def test_it_returns_items
    engine = SalesEngine.new("./data")
    merchant = Merchant.new(sample_data, engine)
    assert_equal Item, merchant.items[0].class
  end

  def test_it_returns_invoices
    engine = SalesEngine.new("./data")
    merchant = Merchant.new(sample_data, engine)
    assert_equal Invoice, merchant.invoices[0].class
  end
end
