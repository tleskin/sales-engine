require_relative 'test_helper'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :invoice_repository

  def setup
    @invoice_repository = InvoiceRepository.load(self, './test/test_fixtures/invoices_sample.csv')
  end

  def test_it_exists
    assert InvoiceRepository
  end

  def test_that_invoice_repository_contains_invoice_data
    assert invoice_repository.invoices
  end

  def test_it_returns_all
    assert_equal 10, invoice_repository.all.count
  end

  def test_it_returns_a_random_invoice
    invoice = invoice_repository.random
    assert_equal Invoice, invoice.class
  end

  def test_it_finds_an_invoice_by_id
     results = invoice_repository.find_by_id(1)
     assert_equal 1, results.id
  end

  def test_it_finds_an_invoice_by_customer_id
    results = invoice_repository.find_by_customer_id(1)
    assert_equal 1, results.customer_id
  end

  def test_it_finds_an_invoice_by_merchant_id
    results = invoice_repository.find_by_merchant_id(26)
    assert_equal 26, results.merchant_id
  end

  def test_it_finds_an_invoice_by_status
    results = invoice_repository.find_by_status("shipped")
    assert_equal "shipped", results.status
  end

  def test_it_finds_an_invoice_by_created_at
     results = invoice_repository.find_by_created_at("2012-03-25 09:54:09 UTC")
     assert_equal "2012-03-25 09:54:09 UTC", results.created_at
  end

  def test_it_finds_an_invoice_by_updated_at
     results = invoice_repository.find_by_updated_at("2012-03-25 09:54:09 UTC")
     assert_equal "2012-03-25 09:54:09 UTC", results.updated_at
  end

  def test_finds_all_invoices_by_customer_id
    results = invoice_repository.find_all_by_customer_id(1)
    assert_equal 8, results.count
  end

  def test_it_finds_all_invoices_by_merchant_id
    results = invoice_repository.find_all_by_merchant_id(26)
    assert_equal 2, results.count
  end

  def test_it_finds_all_invoices_by_status
    results = invoice_repository.find_all_by_status("shipped")
    assert_equal 10, results.count
  end

  def test_it_finds_all_invoices_by_created_at
    results = invoice_repository.find_all_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, results.count
  end

  def test_it_finds_all_invoices_by_updated_at
    results = invoice_repository.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, results.count
  end

end
