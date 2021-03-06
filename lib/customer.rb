require 'pry'

class Customer

  attr_reader :id, :first_name, :last_name,
              :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def invoices
    @repository.find_all_invoices_by_customer_id(id)
  end

  def transactions
    invoices.map {|invoice| invoice.transactions}.flatten
  end

  # def successful_transactions
  #   transactions.select do |transaction|
  #     transaction.result == "success"
  #   end
  # end

  def favorite_merchant

    successful_invoices = invoices.select {|invoice| invoice.successful?}

    successful_merchants = successful_invoices.map {|invoice| invoice.merchant_id}

    repository.find_merchant(successful_merchants[0])

  end
end
