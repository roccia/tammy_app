require 'test_helper'

class TwitterInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twitter_info = twitter_infos(:one)
  end

  test "should get index" do
    get twitter_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_twitter_info_url
    assert_response :success
  end

  test "should create twitter_info" do
    assert_difference('TwitterInfo.count') do
      post twitter_infos_url, params: { twitter_info: {  } }
    end

    assert_redirected_to twitter_info_url(TwitterInfo.last)
  end

  test "should search twitter_info" do
    get twitter_info_url(@twitter_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_twitter_info_url(@twitter_info)
    assert_response :success
  end

  test "should update twitter_info" do
    patch twitter_info_url(@twitter_info), params: { twitter_info: {  } }
    assert_redirected_to twitter_info_url(@twitter_info)
  end

  test "should destroy twitter_info" do
    assert_difference('TwitterInfo.count', -1) do
      delete twitter_info_url(@twitter_info)
    end

    assert_redirected_to twitter_infos_url
  end
end
