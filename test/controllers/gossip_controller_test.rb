require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get gossip_display_url
    assert_response :success
  end

end
