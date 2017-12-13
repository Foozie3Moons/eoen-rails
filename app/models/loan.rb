class Loan < ApplicationRecord
  belongs_to :user

  validates :name, length: { in: 1..36}, presence: true, uniqueness: true
  validates :payments_per_year, :down_payment, :lifespan, :apr, :amount, numericality: { greater_than: 0,  message: "Amount must be greater than 0"}

  def total_payments
    return self.payments_per_year * self.lifespan
  end

  def monthly_payment
    loan, n, r = self.amount - self.down_payment, total_payments, self.apr / 12
    # pmt is the constant payment you make every period
    # r is the interest rate per period
    # n is the number of periods
    # loan is the total loan amount
    # https://www.investopedia.com/terms/f/fixed-rate-payment.asp
    pmt = (r / (1 - ((1 + r) ** -n)) * loan) * 100
    return pmt.round
  end
end
