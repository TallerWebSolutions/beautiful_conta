require 'test_helper'

class SmallCompanyTest < ActiveSupport::TestCase
  
  test "Should not save without requirements" do
    user = User.first
    small_company = user.build_small_company
    assert_not small_company.save
  end
end
