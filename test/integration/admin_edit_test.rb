require 'test_helper'

class AdminsEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin = admins(:michael)
  end

  test "unsuccessful edit" do
    log_in_as_admin(@admin)
    get edit_admin_path(@admin)
    assert_template 'admins/edit'
    patch user_path(@admin), params: { admin: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo"
                                             } }

    assert_template 'admins/edit'
  end

   test "successful edit" do
    log_in_as(@admin)
    get edit_admin_path(@admin)
    assert_template 'admins/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch admin_path(@admin), params: { admin: { name:  name,
                                              email: email,
                                              password: "password"             
                                            } 
                                            }
    assert_not flash.empty?
    assert_redirected_to @admin
    @admin.reload
    assert_equal name,  @admin.name
    assert_equal email, @admin.email
  end

end