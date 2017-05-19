require 'test_helper'

class TopiksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topik = topiks(:one)
  end

  test "should get index" do
    get topiks_url
    assert_response :success
  end

  test "should get new" do
    get new_topik_url
    assert_response :success
  end

  test "should create topik" do
    assert_difference('Topik.count') do
      post topiks_url, params: { topik: { nama: @topik.nama } }
    end

    assert_redirected_to topik_url(Topik.last)
  end

  test "should show topik" do
    get topik_url(@topik)
    assert_response :success
  end

  test "should get edit" do
    get edit_topik_url(@topik)
    assert_response :success
  end

  test "should update topik" do
    patch topik_url(@topik), params: { topik: { nama: @topik.nama } }
    assert_redirected_to topik_url(@topik)
  end

  test "should destroy topik" do
    assert_difference('Topik.count', -1) do
      delete topik_url(@topik)
    end

    assert_redirected_to topiks_url
  end
end
