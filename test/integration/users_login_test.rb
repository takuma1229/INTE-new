require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with valid information followed by logout" do
    get sessions_path
    post sessions_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", sessions_path, count: 0
    assert_select "a[href=?]", session_path(@user)
    delete session_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", sessions_path
    assert_select "a[href=?]", session_path(@user),      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with valid email/invalid password" do
    get sessions_path
    assert_template 'sessions/index'
    post sessions_path, params: { session: { email:    @user.email,
                              password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/index'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end