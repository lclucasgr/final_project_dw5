require 'test_helper'

class LibrarierEditTest < ActionDispatch::IntegrationTest

  def setup
    @librarier = librariers(:john)
    @admin = admins(:michael)
  end

  test "unsuccessful edit" do
    log_in_as_librarier(@librarier)
    get edit_librarier_path(@librarier)
    assert_template 'librariers/edit'
    patch admin_path(@librarier), params: { librarier: { name:  "",
                                              email: "foo@invalid",
                                              password: "foo"
                                             } }
 
    assert_template 'librariers/edit'
  end

  test "successful edit" do
    get edit_librarier_path(@librarier)
    assert_template 'librariers/edit'
    name  = "librarier"
    email = "foo@bar.com"
    patch librarier_path(@librarier), params: { librarier: { name:  name,
                                              email: email,
                                              password: "",
                                               } }
    
    assert_not @librarier.logged_in_librarier
    assert_not flash.empty?
    assert_redirected_to '/admin/librarier/index' 
    assert_not @admin.admin_logged_in?
    assert_not flash.empty?
    assert_redirected_to '/librarier/book/index'
    @admin.reload
    assert_equal name,  @librarier.name
    assert_equal email, @librarier.email
  end

end
