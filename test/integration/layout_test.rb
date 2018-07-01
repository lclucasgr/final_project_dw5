require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'home/index'
    assert_select "a[href=?]", admin_session_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", librarier_session_path
  end
end