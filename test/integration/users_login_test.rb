require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get sessions_path
    assert_template 'sessions/index'
    post sessions_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/index'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end