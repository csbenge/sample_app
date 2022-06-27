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
    @user.activation_token = User.new_token
    @user.reset_token = User.new_token
    mail = UserMailer.password_reset(@user)
    assert_equal "Password reset", mail.subject
    assert_equal ["tuser1@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
    assert_match @user.reset_token,        mail.body.encoded
    assert_match CGI::escape(@user.email), mail.body.encoded
  end

end
