require 'csv'
require 'bigdecimal'

class InvoiceItem
  attr_reader :id, :item_id, :invoice_id,
              :quantity, :unit_price, :created_at,
              :updated_at, :repository

  def initialize (data, repository)
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity = data[:quantity].to_i
    @unit_price = data[:unit_price].to_d/100
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def find_by_item_id
    repository.find_by_item_id(id)
  end

  def item
    repository.find_item(item_id)
  end

  def invoice
    repository.find_invoice(invoice_id)
  end

  def customer
    customer_repository.find_invoice(invoice_id)
  end
end
