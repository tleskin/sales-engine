require 'csv'

class InvoiceItem
  attr_accessor :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at

  def initialize (data, sales_engine)
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id]
    @quantity = data[:quantity]
    @unit_price = data[:unit_price]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @sales_engine = sales_engine
  end
end