require "test_helper"

class PicturehashControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get picturehash_destroy_url
    assert_response :success
  end
end
