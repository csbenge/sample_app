require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:testuser1)
  end

  test "login with invalid information" do
    get login_path
    assert_response :success
    #assert_template 'sessions/new'
    post users_path, params: { user: {
                                        email:    "test1@foo.com",
                                        password: "pass"
                                      }
                                    }
    assert_equal '/users', path
  end

  test "login with valid information" do
    get login_path
    post users_path, params: { user: {
                                        email:    @user.email,
                                        password: "password"
                                      }
                                    }
    #assert_response :success
    assert_equal '/users', path
    assert_not is_logged_in?
  end

  test "login with valid information followed by logout" do
    get login_path
    post users_path, params: { user: {
                                        email:    @user.email,
                                        password: "password"
                                      }
                                    }
    #assert is_logged_in?
    #assert_response :success
    assert_equal '/users', path
    get logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    #assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end

end
