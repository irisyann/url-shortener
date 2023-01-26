require "test_helper"

class ShortUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get short_urls_index_url
    assert_response :success
  end
end
