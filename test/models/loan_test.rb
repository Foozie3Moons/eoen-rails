require "test_helper"

describe Loan do
  it "must be valid" do
    loan = create(:loan)
    value(loan).must_be :valid?
  end
end
