require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "test", email: "test_user@example.com", 
      password: "password", password_confirmation: "password")
  end

  test "should get valid user" do
    assert @user.valid?
  end

  test "should get invalid user when name field is blank" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "should get invalid user when email field is blank" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "should not valid when name is more than 50 character"do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "should not valid when email is more than 255 character"do
    @user.email = "a" * 255 + "example.com"
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?, "Password should not be blank"
  end

  test "password should be minimum of length 6" do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?, "Password is less than 6"
  end

  test "should not valid password mismatch" do
    @user.password = "foobar"
    @user.password_confirmation = "password"
    assert_not @user.valid?
  end

  test "should get invalid email address" do
    invalid_addresses = %w[ foobar,baz foo user.example user.name@example. foo+bar@baz ]
    invalid_addresses.each do | invalid_address |
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end

  test "should valid unique email address" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be saved as lowercase" do
    mixed_case_email = "FOoBar@ExAmpLe.CoM"
    @user.email = mixed_case_email
    @user.save
    assert mixed_case_email.downcase, @user.reload.email
  end
end
