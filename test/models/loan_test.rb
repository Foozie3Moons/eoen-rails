require "test_helper"

describe Loan do
  before do
    @loan = create(:loan)
  end

  it "must be valid" do
    value(@loan).must_be :valid?
  end

  it "should get total payments" do
    @loan.total_payments.must_equal 60
  end

  it "should calculate a monthly payment" do
    @loan.monthly_payment.must_equal 9322
  end

  it "should convert cents to dollars" do
    @loan.monthly_payment.to_dollars.must_equal "93.22"
  end
end
