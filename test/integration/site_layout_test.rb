require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/index'
    assert_select "a[href=?]", sessions_path, count: 3
    assert_select "a[href=?]", new_user_path, count: 2
  end
end
