require "test_helper"

describe Loan do
  it "must be valid" do
    loan = build(:loan)
    value(loan).must_be :valid?
  end
end
