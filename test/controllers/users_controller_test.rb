require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  

  def setup
    @user       = users(:testuser1)
    @other_user = users(:testuser2)
  end

  test "should redirect index when not logged in" do
    get users_url
    assert_redirected_to login_url
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    #get :edit, id: @user
    #assert_not flash.empty?
    #assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    #patch :update, id: @user, user: { name: @user.name, email: @user.email }
    #assert_not flash.empty?
    #assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    #get :edit, id: @user
    #assert flash.empty?
    #assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    #log_in_as(@other_user)
    #patch :update, id: @user, user: { name: @user.name, email: @user.email }
    #assert flash.empty?
    #assert_redirected_to root_url
  end

end
