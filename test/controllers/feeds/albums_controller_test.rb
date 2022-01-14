require "test_helper"

class Feeds::AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get discovers/albums" do
    get feeds_albums_discovers/albums_url
    assert_response :success
  end
end
