require 'test_helper'

class LibrarierTest < ActiveSupport::TestCase
 
    def setup
    @librarier = Librarier.new(name: "Librarier", email: "librarier@librarier.com", password: "password")
  end

  test "should be valid" do
    assert @librarier.valid?
  end

  test "name should be present" do
    @librarier.name = "     "
    assert_not @librarier.valid?
  end

   test "email should be present" do
    @librarier.email = "     "
    assert_not @librarier.valid?
  end
  
  test "name should not be too long" do
    @librarier.name = "a" * 51
    assert_not @librarier.valid?
  end

  test "email should not be too long" do
    @librarier.email = "a" * 245 + "@example.com"
    assert_not @librarier.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @librarier.email = valid_address
      assert @librarier.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @librarier.email = invalid_address
      assert_not @librarier.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_librarier = @librarier.dup
    duplicate_librarier.email = @librarier.email.upcase
    @librarier.save
    assert_not duplicate_librarier.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @librarier.email = mixed_case_email
    @librarier.save
    assert_equal mixed_case_email.downcase, @librarier.reload.email
  end

   test "password should be present (nonblank)" do
    @librarier.password = "  "
    assert_not @librarier.valid?
  end

  test "password should have a minimum length" do
    @librarier.password  = "a" * 5
    assert_not @librarier.valid?
  end

  test "password should have a maximum length" do
    @librarier.password  = "a" * 41
    assert_not @librarier.valid?
  end

end
