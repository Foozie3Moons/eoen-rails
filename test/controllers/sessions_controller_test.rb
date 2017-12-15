require "test_helper"

describe SessionsController do
  it "should create new session" do
    post login_url
    #value(response).must_be :success?
  end

  it "should destroy session" do
    destroy logout_url
    #value(response).must_be :success?
  end

  it "should get new and show login form" do
    get login_url
    value(response).must_be :success?
  end

end
