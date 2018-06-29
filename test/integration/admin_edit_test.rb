require 'test_helper'

class AdminsEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin = admins(:michael)
  end

  test "unsuccessful edit" do
    log_in_as_admin(@admin)
    get edit_admin_path(@admin)
    assert_template 'admins/edit'
    patch admin_path(@admin), params: { admin: { name:  "",
                                              email: "foo@invalid",
                                              password_digest:              "foo"
                                             } }
 
    assert_template 'admins/3/edit'
  end

   test "successful edit" do
    log_in_as_admin(@admin)
    get edit_admin_path(@admin)
    assert_template 'admins/3/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch admin_path(@admin), params: { admin: { name:  name,
                                              email: email,
                                              password_digest: "password"             
                                            } 
                                            }
    assert_redirected_to @admin
    @admin.reload
    assert_equal name,  @admin.name
    assert_equal email, @admin.email
  end

end
