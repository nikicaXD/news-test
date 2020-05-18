require 'test_helper'

class RelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get follower_id:integer" do
    get relationship_follower_id:integer_url
    assert_response :success
  end

  test "should get followed_id:integer" do
    get relationship_followed_id:integer_url
    assert_response :success
  end

end
