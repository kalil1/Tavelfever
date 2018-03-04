require 'test_helper'

class UseritemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @useritem = useritems(:one)
  end

  test "should get index" do
    get useritems_url
    assert_response :success
  end

  test "should get new" do
    get new_useritem_url
    assert_response :success
  end

  test "should create useritem" do
    assert_difference('Useritem.count') do
      post useritems_url, params: { useritem: { checklist_id: @useritem.checklist_id, name: @useritem.name, user_id: @useritem.user_id } }
    end

    assert_redirected_to useritem_url(Useritem.last)
  end

  test "should show useritem" do
    get useritem_url(@useritem)
    assert_response :success
  end

  test "should get edit" do
    get edit_useritem_url(@useritem)
    assert_response :success
  end

  test "should update useritem" do
    patch useritem_url(@useritem), params: { useritem: { checklist_id: @useritem.checklist_id, name: @useritem.name, user_id: @useritem.user_id } }
    assert_redirected_to useritem_url(@useritem)
  end

  test "should destroy useritem" do
    assert_difference('Useritem.count', -1) do
      delete useritem_url(@useritem)
    end

    assert_redirected_to useritems_url
  end
end
