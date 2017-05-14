require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get webdesign" do
    get static_pages_webdesign_url
    assert_response :success
  end

  test "should get schermreparatie" do
    get static_pages_schermreparatie_url
    assert_response :success
  end

  test "should get datarecovery" do
    get static_pages_datarecovery_url
    assert_response :success
  end

  test "should get pchulp" do
    get static_pages_pchulp_url
    assert_response :success
  end

end
