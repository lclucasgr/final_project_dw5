require 'test_helper'

class AdminEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin = admins(:michael)
  end

  test "unsuccessful edit" do
    log_in_as_admin(@admin)
    get edit_admin_path(@admin)
    assert_template 'admins/edit'
    patch admin_path(@admin), params: { admin: { name:  "",
                                              email: "foo@invalid",
                                              password: "foo"
                                             } }
 
    assert_template 'admins/edit'
  end

  test "successful edit" do
    get edit_admin_path(@admin)
    assert_template 'admins/edit'
    name  = "Admin"
    email = "foo@bar.com"
    patch admin_path(@admin), params: { admin: { name:  name,
                                              email: email,
                                              password: "",
                                               } }
    assert_not flash.empty?
    assert_redirected_to '/admin/librarier/index'
    @admin.reload
    assert_equal name,  @admin.name
    assert_equal email, @admin.email
  end

end
