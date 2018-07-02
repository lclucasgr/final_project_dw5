require 'test_helper'

class LibrariersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get admin_librarier_new_path
    assert_no_difference 'Librarier.count' do
    post admin_librarier_new_path, params: { librarier: { name:  "",
                                         email: "librarier@invalid",
                                         password:              "foo"
                                          } }
    end
    assert_template 'librariers/new'
  end

  test "valid signup information" do
    get admin_librarier_new_path
    assert_difference 'Librarier.count', 1 do
    post admin_librarier_new_path, params: { librarier: { name:  "Example",
                                         email: "librarier@example.com",
                                         password:"password",
                                          } }
    end
    assert_redirected_to '/admin/librarier/index'
   end
end