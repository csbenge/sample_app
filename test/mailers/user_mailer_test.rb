require "test_helper"

class UserMailerTest < ActionMailer::TestCase

  def setup
    @user = users(:testuser1)
  end

  test "account_activation" do
    #user = User.first
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Account activation", mail.subject
    assert_equal ["tuser1@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
 end
  

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
