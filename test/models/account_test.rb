require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "should create account" do
    account = Account.new
    account.username = "test"
    account.password = 'details'
    assert account.save, "Account successfully created."
  end
end
