require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @librarier = librariers(:john)
    @admin = admins(:michael)
  end

  test "current_librarier returns right user when session is nil" do
    assert_equal @librarier, current_librarier
    assert librarier_logged_in?
  end

  test "current_admin returns right user when session is nil" do
    assert_equal @admin, current_admin
    assert admin_logged_in?
  end

 end