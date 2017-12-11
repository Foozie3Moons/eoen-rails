class Loan < ApplicationRecord
  belongs_to :user

  def total_payments
    return self.payments_per_year * self.lifespan
  end

  def monthly_payment
    loan, n, r = self.amount - self.down_payment, total_payments, self.apr / 12
    pmt = (r / (1 - ((1 + r) ** -n)) * loan) * 100
    return pmt.round
  end
end
