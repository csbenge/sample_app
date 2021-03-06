require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testuser1)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_includes path, '/edit'
    patch user_path(@user), params: { user: { 
                                      name:  "",
                                      email: "foo@invalid",
                                      password:              "foo",
                                      password_confirmation: "bar" }
                                    }
    assert_includes path, '/users'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_includes path, '/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { 
                                      name:  name,
                                      email: email,
                                      password:              "",
                                      password_confirmation: "" }
                                    }
    assert_not flash.empty?
    #assert_redirected_to @user
    @user.reload
    #assert_equal name,  @user.name
    #assert_equal email, @user.email
  end

end
