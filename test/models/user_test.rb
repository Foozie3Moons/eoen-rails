require "test_helper"

describe User do
  it "must be valid" do
    user = create(:user)
    value(user).must_be :valid?
  end
end
